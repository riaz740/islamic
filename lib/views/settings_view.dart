import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SettingsController settingsController = Get.find<SettingsController>();

  final List<String> calculationMethods = [
    'Muslim World League',
    'Egyptian General Authority',
    'University of Islamic Sciences, Karachi',
    'Umm Al-Qura University, Makkah',
    'Dubai',
    'Qatar',
    'Kuwait',
    'Moonsighting Committee',
    'Singapore',
    'Turkey',
    'Tehran',
    'North America (ISNA)',
  ];

  final List<String> languages = ['English', 'Arabic', 'Urdu', 'Bengali'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionHeader('Appearance'),
            Card(
              elevation: 0,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    secondary: const Icon(Icons.dark_mode_outlined),
                    value: settingsController.isDarkMode.value,
                    onChanged: (value) => settingsController.toggleTheme(),
                  ),
                  const Divider(height: 1, indent: 56),
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: const Text('Language'),
                    subtitle: Text(settingsController.selectedLanguage.value),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showLanguageSelector(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Prayer Settings'),
            Card(
              elevation: 0,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.access_time_outlined),
                    title: const Text('Calculation Method'),
                    subtitle: Text(
                      calculationMethods[settingsController
                          .calculationMethodIndex
                          .value],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showCalculationMethodSelector(context),
                  ),
                  const Divider(height: 1, indent: 56),
                  ListTile(
                    leading: const Icon(Icons.calendar_today_outlined),
                    title: const Text('Hijri Adjustment'),
                    subtitle: Text(
                      '${settingsController.hijriAdjustment.value} Days',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showHijriAdjustmentDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Notifications'),
            Card(
              elevation: 0,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications_outlined),
                    title: const Text('Reminder Type'),
                    subtitle: Text(
                      settingsController
                          .notificationType
                          .value
                          .capitalizeFirst!,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showNotificationTypeSelector(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Misc'),
            Card(
              elevation: 0,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Sync Home Widget'),
                    secondary: const Icon(Icons.widgets_outlined),
                    value: settingsController.syncHomeWidget.value,
                    onChanged: (value) => settingsController.toggleSyncWidget(),
                  ),
                  const Divider(height: 1, indent: 56),
                  ListTile(
                    leading: const Icon(Icons.backup_outlined),
                    title: const Text('Backup & Restore'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.snackbar(
                        'Coming Soon',
                        'This feature is under development',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Language',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...languages.map(
              (lang) => ListTile(
                title: Text(lang),
                trailing: settingsController.selectedLanguage.value == lang
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () {
                  settingsController.setLanguage(lang);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCalculationMethodSelector(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Calculation Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: RadioGroup<int>(
                groupValue: settingsController.calculationMethodIndex.value,
                onChanged: (val) {
                  if (val != null) {
                    settingsController.setCalculationMethod(val);
                    Get.back();
                  }
                },
                child: ListView.builder(
                  itemCount: calculationMethods.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<int>(
                      value: index,
                      title: Text(calculationMethods[index]),
                    );
                  },
                ),
              ),
            ),
            TextButton(onPressed: () => Get.back(), child: const Text('Close')),
          ],
        ),
      ),
    );
  }

  void _showHijriAdjustmentDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Hijri Adjustment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Adjust Hijri date by days (+/- 2)'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      if (settingsController.hijriAdjustment.value > -2) {
                        settingsController.setHijriAdjustment(
                          settingsController.hijriAdjustment.value - 1,
                        );
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Obx(
                    () => Text(
                      '${settingsController.hijriAdjustment.value}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (settingsController.hijriAdjustment.value < 2) {
                        settingsController.setHijriAdjustment(
                          settingsController.hijriAdjustment.value + 1,
                        );
                      }
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNotificationTypeSelector(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Reminder Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text('Notification'),
              trailing:
                  settingsController.notificationType.value == 'notification'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                settingsController.setNotificationType('notification');
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.volume_up),
              title: const Text('Adhan'),
              trailing: settingsController.notificationType.value == 'adhan'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                settingsController.setNotificationType('adhan');
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
