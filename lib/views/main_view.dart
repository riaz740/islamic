import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic/l10n/app_localizations.dart';
import '../controllers/navigation_controller.dart';
import 'home_view.dart';
import 'tracker_view.dart';
import 'hifz_view.dart';
import 'education_view.dart';
import 'settings_view.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> _pages = [
    HomeView(),
    TrackerView(),
    HifzView(),
    EducationView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[navController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00BCD4),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.show_chart_outlined),
              activeIcon: const Icon(Icons.show_chart),
              label: AppLocalizations.of(context)!.tracker,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.book_outlined),
              activeIcon: const Icon(Icons.book),
              label: AppLocalizations.of(context)!.hifz,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.school_outlined),
              activeIcon: const Icon(Icons.school),
              label: AppLocalizations.of(context)!.education,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
