import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/surah.dart';
import '../data/quran_data.dart';

class HifzController extends GetxController {
  var surahs = <Surah>[].obs;
  var totalHifzProgress = 0.0.obs;
  var surahHifzProgress = 0.0.obs;
  var juzHifzProgress = 0.0.obs;
  var ayahHifzProgress = 0.0.obs;

  var totalJuz = 30;
  var totalAyah = 6236;

  @override
  void onInit() {
    super.onInit();
    loadSurahs();
  }

  Future<void> loadSurahs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? surahsJson = prefs.getString('surahs');

    if (surahsJson != null) {
      final List<dynamic> decoded = jsonDecode(surahsJson);
      surahs.value = decoded.map((s) => Surah.fromJson(s)).toList();
    } else {
      surahs.value = QuranData.getSurahs();
    }

    calculateProgress();
  }

  Future<void> saveSurahs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(surahs.map((s) => s.toJson()).toList());
    await prefs.setString('surahs', encoded);
  }

  void updateSurahProgress(int surahNumber, int memorizedAyah) {
    final index = surahs.indexWhere((s) => s.number == surahNumber);
    if (index != -1) {
      surahs[index] = surahs[index].copyWith(
        memorizedAyah: memorizedAyah,
        lastOpened: DateTime.now(),
      );
      saveSurahs();
      calculateProgress();
    }
  }

  void calculateProgress() {
    int totalMemorized = 0;
    int totalAyahs = 0;
    int completedSurahs = 0;

    for (var surah in surahs) {
      totalMemorized += surah.memorizedAyah;
      totalAyahs += surah.ayahCount;
      if (surah.memorizedAyah == surah.ayahCount) {
        completedSurahs++;
      }
    }

    totalHifzProgress.value = totalAyahs > 0
        ? (totalMemorized / totalAyahs) * 100
        : 0;
    surahHifzProgress.value = surahs.isNotEmpty
        ? (completedSurahs / surahs.length) * 100
        : 0;
    ayahHifzProgress.value = totalAyah > 0
        ? (totalMemorized / totalAyah) * 100
        : 0;

    juzHifzProgress.value = totalAyahs > 0
        ? (totalMemorized / totalAyah) * 30
        : 0;
  }

  int get totalMemorizedAyahs {
    int total = 0;
    for (var surah in surahs) {
      total += surah.memorizedAyah;
    }
    return total;
  }
}
