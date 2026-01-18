import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';

class PrayerTimeController extends GetxController {
  var selectedCity = 'Maghrib'.obs;
  var currentTime = '00:55:00'.obs;
  var timeRemaining = 'Left'.obs;
  var selectedDate = '20 Nov, 2025'.obs;

  var currentDateTime = DateTime.now().obs;

  var prayers = <Map<String, String>>[].obs;

  final coordinates = Coordinates(23.8103, 90.4125);
  final params = CalculationMethod.muslim_world_league.getParameters();

  @override
  void onInit() {
    super.onInit();
    updateCurrentTime();
    calculatePrayerTimes();

    // Update time every second
    Future.delayed(const Duration(seconds: 1), () {
      updateCurrentTime();
    });
  }

  void updateCurrentTime() {
    final now = DateTime.now();
    currentDateTime.value = now;
    currentTime.value = DateFormat('HH:mm:ss').format(now);
    selectedDate.value = DateFormat('dd MMM, yyyy').format(now);

    // Calculate time remaining to next prayer
    calculateTimeRemaining();

    // Continue updating
    Future.delayed(const Duration(seconds: 1), () {
      updateCurrentTime();
    });
  }

  void calculateTimeRemaining() {
    final now = DateTime.now();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    final nextPrayer = prayerTimes.nextPrayer();
    final nextPrayerTime = prayerTimes.timeForPrayer(nextPrayer);

    if (nextPrayerTime != null) {
      final difference = nextPrayerTime.difference(now);
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      timeRemaining.value = '$hours hour $minutes min until ${nextPrayer.name}';
    }
  }

  void calculatePrayerTimes() {
    final date = currentDateTime.value;
    final prayerTimes = PrayerTimes(
      coordinates,
      DateComponents.from(date),
      params,
    );

    // Get sunrise time
    final sunrise = prayerTimes.sunrise;

    prayers.value = [
      {
        'name': 'Fajr',
        'startTime': DateFormat('h:mm a').format(prayerTimes.fajr),
        'endTime': DateFormat('h:mm a').format(sunrise),
        'icon': 'fajr',
        'color': 'pink',
      },
      {
        'name': 'Sunrise',
        'startTime': '',
        'endTime': DateFormat('h:mm a').format(sunrise),
        'icon': 'sunrise',
        'color': 'orange',
      },
      {
        'name': 'Dhuhr Time',
        'startTime': DateFormat('h:mm a').format(prayerTimes.dhuhr),
        'endTime': DateFormat('h:mm a').format(prayerTimes.asr),
        'icon': 'dhuhr',
        'color': 'blue',
      },
      {
        'name': 'Salatul Duha',
        'startTime': DateFormat(
          'h:mm a',
        ).format(sunrise.add(const Duration(minutes: 20))),
        'endTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.dhuhr.subtract(const Duration(minutes: 10))),
        'icon': 'dhuhr',
        'color': 'green',
      },
      {
        'name': 'Forbidden Time',
        'startTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.dhuhr.subtract(const Duration(minutes: 10))),
        'endTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.dhuhr.add(const Duration(minutes: 10))),
        'icon': 'maghrib',
        'color': 'red',
      },
      {
        'name': 'Dhuhr',
        'startTime': DateFormat('h:mm a').format(prayerTimes.dhuhr),
        'endTime': DateFormat('h:mm a').format(prayerTimes.asr),
        'icon': 'dhuhr',
        'color': 'blue',
      },
      {
        'name': 'Asr (Hanafi)',
        'startTime': DateFormat('h:mm a').format(prayerTimes.asr),
        'endTime': DateFormat('h:mm a').format(prayerTimes.maghrib),
        'icon': 'asr',
        'color': 'green',
      },
      {
        'name': 'Forbidden Time',
        'startTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.maghrib.subtract(const Duration(minutes: 10))),
        'endTime': DateFormat('h:mm a').format(prayerTimes.maghrib),
        'icon': 'maghrib',
        'color': 'red',
      },
      {
        'name': 'Sunset',
        'startTime': '',
        'endTime': DateFormat('h:mm a').format(prayerTimes.maghrib),
        'icon': 'sunrise',
        'color': 'orange',
      },
      {
        'name': 'Maghrib',
        'startTime': DateFormat('h:mm a').format(prayerTimes.maghrib),
        'endTime': DateFormat('h:mm a').format(prayerTimes.isha),
        'icon': 'maghrib',
        'color': 'purple',
      },
      {
        'name': 'Isha',
        'startTime': DateFormat('h:mm a').format(prayerTimes.isha),
        'endTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.fajr.add(const Duration(days: 1))),
        'icon': 'isha',
        'color': 'indigo',
      },
      {
        'name': 'Tahajjud',
        'startTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.isha.add(const Duration(hours: 2))),
        'endTime': DateFormat(
          'h:mm a',
        ).format(prayerTimes.fajr.add(const Duration(days: 1))),
        'icon': 'isha',
        'color': 'gray',
      },
    ];
  }

  void previousDay() {
    currentDateTime.value = currentDateTime.value.subtract(
      const Duration(days: 1),
    );
    selectedDate.value = DateFormat(
      'dd MMM, yyyy',
    ).format(currentDateTime.value);
    calculatePrayerTimes();
  }

  void nextDay() {
    currentDateTime.value = currentDateTime.value.add(const Duration(days: 1));
    selectedDate.value = DateFormat(
      'dd MMM, yyyy',
    ).format(currentDateTime.value);
    calculatePrayerTimes();
  }

  void changeCity(String city) {
    selectedCity.value = city;
    // You can update coordinates based on city
    calculatePrayerTimes();
  }
}
