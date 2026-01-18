import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var selectedLanguage = 'English'.obs;
  var notificationType = 'notification'.obs;
  var syncHomeWidget = false.obs;
  var calculationMethodIndex = 2.obs; // Default to Muslim World League (usually index 2 or 3 depending on list)
  var hijriAdjustment = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    selectedLanguage.value = prefs.getString('language') ?? 'English';
    notificationType.value =
        prefs.getString('notificationType') ?? 'notification';
    syncHomeWidget.value = prefs.getBool('syncHomeWidget') ?? false;
    calculationMethodIndex.value = prefs.getInt('calculationMethodIndex') ?? 2;
    hijriAdjustment.value = prefs.getInt('hijriAdjustment') ?? 0;
  }

  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setLanguage(String language) async {
    selectedLanguage.value = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    // Add localization logic here later if needed
    var locale = const Locale('en', 'US');
    if (language == 'Arabic') {
      locale = const Locale('ar', 'SA');
    }
    Get.updateLocale(locale);
  }

  Future<void> setNotificationType(String type) async {
    notificationType.value = type;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notificationType', type);
  }

  Future<void> toggleSyncWidget() async {
    syncHomeWidget.value = !syncHomeWidget.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('syncHomeWidget', syncHomeWidget.value);
  }

  Future<void> setCalculationMethod(int index) async {
    calculationMethodIndex.value = index;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('calculationMethodIndex', index);
  }

  Future<void> setHijriAdjustment(int days) async {
    hijriAdjustment.value = days;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hijriAdjustment', days);
  }
}
