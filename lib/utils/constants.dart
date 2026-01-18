import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF00BCD4);
  static const primaryDark = Color(0xFF0097A7);
  static const accent = Color(0xFF4CAF50);

  // Prayer colors
  static const fajr = Color(0xFF9C27B0);
  static const dhuhr = Color(0xFF2196F3);
  static const asr = Color(0xFFFF9800);
  static const maghrib = Color(0xFFE91E63);
  static const isha = Color(0xFF673AB7);
}

class AppConstants {
  static const String appName = 'Islamic App';
  static const int totalSurahs = 114;
  static const int totalJuz = 30;
  static const int totalAyah = 6236;

  static const List<String> prayerNames = [
    'Fajr',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];
}
