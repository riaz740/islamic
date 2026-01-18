import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/tracker_data.dart';

class TrackerController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var trackerHistory = <String, TrackerData>{}.obs;
  var currentMonthData = <TrackerData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTrackerHistory();
  }

  Future<void> loadTrackerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? historyJson = prefs.getString('trackerHistory');

    if (historyJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(historyJson);
      trackerHistory.value = decoded.map(
        (key, value) => MapEntry(key, TrackerData.fromJson(value)),
      );
    }
    loadCurrentMonth();
  }

  Future<void> saveTrackerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> toSave = trackerHistory.map(
      (key, value) => MapEntry(key, value.toJson()),
    );
    await prefs.setString('trackerHistory', jsonEncode(toSave));
  }

  void loadCurrentMonth() {
    final now = DateTime.now();
    currentMonthData.clear();

    for (int i = 1; i <= DateTime(now.year, now.month + 1, 0).day; i++) {
      final date = DateTime(now.year, now.month, i);
      final dateKey = date.toIso8601String().split('T')[0];

      if (trackerHistory.containsKey(dateKey)) {
        currentMonthData.add(trackerHistory[dateKey]!);
      }
    }
  }

  void updatePrayerStatus(String prayer) {
    final dateKey = selectedDate.value.toIso8601String().split('T')[0];
    Map<String, int> counts = {
      'Fajr': 0,
      'Dhuhr': 0,
      'Asr': 0,
      'Maghrib': 0,
      'Isha': 0,
    };

    if (trackerHistory.containsKey(dateKey)) {
      counts = Map<String, int>.from(trackerHistory[dateKey]!.prayerCounts);
    }

    // Toggle: if 1 set to 0, if 0 set to 1
    counts[prayer] = (counts[prayer] == 1) ? 0 : 1;

    // Calculate scores
    double totalPrayers = 0;
    counts.forEach((key, value) {
      if (value == 1) totalPrayers++;
    });

    double allScore = (totalPrayers / 5) * 100;

    trackerHistory[dateKey] = TrackerData(
      date: selectedDate.value,
      prayerCounts: counts,
      allPrayerScore: allScore,
      fajrScore: (counts['Fajr'] == 1) ? 100.0 : 0.0,
      dhuhrScore: (counts['Dhuhr'] == 1) ? 100.0 : 0.0,
      asrScore: (counts['Asr'] == 1) ? 100.0 : 0.0,
    );
    trackerHistory.refresh(); // Notify listeners
    saveTrackerHistory();
    loadCurrentMonth();
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  bool isPrayerCompleted(String prayer) {
    final dateKey = selectedDate.value.toIso8601String().split('T')[0];
    if (!trackerHistory.containsKey(dateKey)) return false;
    return trackerHistory[dateKey]!.prayerCounts[prayer] == 1;
  }

  double getPrayerScore(String prayer) {
    if (currentMonthData.isEmpty) return 0.0;
    double total = 0;
    int count = 0;
    for (var data in currentMonthData) {
      if (data.prayerCounts[prayer] == 1) total++;
      count++;
    }
    return count == 0 ? 0.0 : (total / count) * 100;
  }


  double getOverallScore() {
    if (currentMonthData.isEmpty) return 0.0;

    double totalScore = 0;
    for (var data in currentMonthData) {
      totalScore += data.allPrayerScore;
    }
    return totalScore / currentMonthData.length;
  }
}
