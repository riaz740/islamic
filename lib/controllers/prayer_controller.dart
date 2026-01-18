import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhan/adhan.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '../models/prayer_time.dart';
import 'settings_controller.dart';

class PrayerController extends GetxController {
  final SettingsController _settingsController = Get.find<SettingsController>();

  var currentPrayer = Rx<PrayerTime?>(null);
  var nextPrayer = Rx<PrayerTime?>(null);
  var dailyPrayers = Rx<DailyPrayers?>(null);
  var prayerHistory = <String, DailyPrayers>{}.obs;
  var isLoading = true.obs;
  var locationError = ''.obs;

  Coordinates coordinates = Coordinates(
    23.8103,
    90.4125,
  ); // Default fallback (Dhaka)

  @override
  void onInit() {
    super.onInit();
    loadPrayerHistory();
    _initializeLocationAndPrayers();

    // Listen to changes in calculation method
    ever(_settingsController.calculationMethodIndex, (_) {
      calculatePrayerTimes();
    });
  }

  Future<void> _initializeLocationAndPrayers() async {
    await determinePosition();
    await calculatePrayerTimes();
  }

  Future<void> determinePosition() async {
    isLoading.value = true;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationError.value =
            'Location services are disabled. Using default location.';
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationError.value =
              'Location permissions are denied. Using default location.';
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationError.value =
            'Location permissions are permanently denied. Using default location.';
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      coordinates = Coordinates(position.latitude, position.longitude);
      locationError.value = '';
    } catch (e) {
      locationError.value = 'Error getting location: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> calculatePrayerTimes() async {
    final date = DateTime.now();

    // Get parameters from settings
    final methodIndex = _settingsController.calculationMethodIndex.value;
    // Map index to CalculationMethod.
    // CalculationMethod isn't an enum in some versions of Adhan, but has static consts.
    // However, usually there is a way to get them.
    // Let's assume a manual mapping or list for now to be safe.

    CalculationMethod method;
    switch (methodIndex) {
      case 0:
        method = CalculationMethod.muslim_world_league;
        break;
      case 1:
        method = CalculationMethod.egyptian;
        break;
      case 2:
        method = CalculationMethod.karachi;
        break;
      case 3:
        method = CalculationMethod.umm_al_qura;
        break;
      case 4:
        method = CalculationMethod.dubai;
        break;
      case 5:
        method = CalculationMethod.qatar;
        break;
      case 6:
        method = CalculationMethod.kuwait;
        break;
      case 7:
        method = CalculationMethod.moon_sighting_committee;
        break;
      case 8:
        method = CalculationMethod.singapore;
        break;
      case 9:
        method = CalculationMethod.turkey;
        break;
      case 10:
        method = CalculationMethod.tehran;
        break;
      case 11:
        method = CalculationMethod.north_america;
        break;
      default:
        method = CalculationMethod.muslim_world_league;
    }

    final params = method.getParameters();
    params.madhab =
        Madhab.shafi; // Default, maybe add setting for this too later

    final prayerTimes = PrayerTimes.today(coordinates, params);

    final prayers = [
      PrayerTime(name: 'Fajr', time: prayerTimes.fajr),
      PrayerTime(name: 'Dhuhr', time: prayerTimes.dhuhr),
      PrayerTime(name: 'Asr', time: prayerTimes.asr),
      PrayerTime(name: 'Maghrib', time: prayerTimes.maghrib),
      PrayerTime(name: 'Isha', time: prayerTimes.isha),
    ];

    dailyPrayers.value = DailyPrayers(date: date, prayers: prayers);
    updateCurrentAndNextPrayer();
  }

  void updateCurrentAndNextPrayer() {
    if (dailyPrayers.value == null) return;

    final now = DateTime.now();
    final prayers = dailyPrayers.value!.prayers;

    for (int i = 0; i < prayers.length; i++) {
      if (now.isBefore(prayers[i].time)) {
        nextPrayer.value = prayers[i];
        if (i > 0) {
          currentPrayer.value = prayers[i - 1];
        }
        return;
      }
    }

    // If all prayers have passed
    currentPrayer.value = prayers.last;
    nextPrayer.value = null;
  }

  Future<void> togglePrayerCompletion(String prayerName) async {
    if (dailyPrayers.value == null) return;

    final index = dailyPrayers.value!.prayers.indexWhere(
      (p) => p.name == prayerName,
    );
    if (index != -1) {
      dailyPrayers.value!.prayers[index].isCompleted =
          !dailyPrayers.value!.prayers[index].isCompleted;
      dailyPrayers.refresh();
      await savePrayerHistory();
    }
  }

  Future<void> loadPrayerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? historyJson = prefs.getString('prayerHistory');

    if (historyJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(historyJson);
      prayerHistory.value = decoded.map(
        (key, value) => MapEntry(key, DailyPrayers.fromJson(value)),
      );
    }
  }

  Future<void> savePrayerHistory() async {
    if (dailyPrayers.value != null) {
      final dateKey = dailyPrayers.value!.date.toIso8601String().split('T')[0];
      prayerHistory[dateKey] = dailyPrayers.value!;

      final prefs = await SharedPreferences.getInstance();
      final Map<String, dynamic> toSave = prayerHistory.map(
        (key, value) => MapEntry(key, value.toJson()),
      );
      await prefs.setString('prayerHistory', jsonEncode(toSave));
    }
  }
}
