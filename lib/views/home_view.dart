import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/prayer_controller.dart';
import 'prayer_time_view.dart';
import 'quran_view.dart';
import 'hadith_view.dart';
import 'dua_view.dart';
import 'qibla_view.dart';
import 'tasbih_view.dart';
import 'zakat_view.dart';
import 'hijri_view.dart';

import 'community_view.dart';
import 'mosque_view.dart';
import 'kitab_view.dart';
import 'donate_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PrayerController prayerController = Get.put(PrayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/app_logo.png',
          height: 32,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Today',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCurrentPrayerCard(),
              const SizedBox(height: 20),
              _buildPrayerTracker(),
              const SizedBox(height: 20),
              _buildQuickActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPrayerCard() {
    return Obx(() {
      final next = prayerController.nextPrayer.value;
      final now = DateTime.now();

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00BCD4), Color(0xFF0097A7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white70, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Now • ${next?.name ?? "Asr"}',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.circle, color: Colors.white70, size: 8),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat('h:mm a').format(now),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '6 hour 10 until (Approx)',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Suhur: ${DateFormat('h:mm a').format(DateTime.now().subtract(const Duration(hours: 5)))}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Iftar: ${DateFormat('h:mm a').format(DateTime.now().add(const Duration(hours: 6)))}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPrayerTracker() {
    return Obx(() {
      final daily = prayerController.dailyPrayers.value;
      final prayers = daily?.prayers ?? [];

      String formatTime(int index) {
        if (prayers.length > index) {
          return DateFormat('h:mm a').format(prayers[index].time);
        }
        return '--:--';
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Prayer Tracker',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat(
                  'dd MMM, yyyy',
                ).format(daily?.date ?? DateTime.now()),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPrayerIcon('Fajr', Icons.wb_twilight, false, formatTime(0)),
              _buildPrayerIcon('Dhuhr', Icons.wb_sunny, false, formatTime(1)),
              _buildPrayerIcon('Asr', Icons.wb_cloudy, false, formatTime(2)),
              _buildPrayerIcon(
                'Maghrib',
                Icons.nights_stay,
                false,
                formatTime(3),
              ),
              _buildPrayerIcon('Isha', Icons.bedtime, false, formatTime(4)),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildPrayerIcon(
    String name,
    IconData icon,
    bool completed,
    String time,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: completed ? const Color(0xFF00BCD4) : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: completed ? Colors.white : Colors.grey),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: completed ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 3),
        Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            _buildActionCard(
              'Prayer\nTime',
              Icons.access_time,
              const Color(0xFF00BCD4),
            ),
            _buildActionCard(
              'Al-Qur\'an',
              Icons.menu_book,
              const Color(0xFF9C27B0),
            ),
            _buildActionCard(
              'Hadith',
              Icons.library_books,
              const Color(0xFF2196F3),
            ),
            _buildActionCard('Dua', Icons.favorite, const Color(0xFFFF9800)),
            _buildActionCard('Qibla', Icons.explore, const Color(0xFF4CAF50)),
            _buildActionCard(
              'Tasbih',
              Icons.radio_button_checked,
              const Color(0xFFE91E63),
            ),
            _buildActionCard('Zakat', Icons.money, const Color(0xFF009688)),
            _buildActionCard(
              'Hijri',
              Icons.calendar_today,
              const Color(0xFF795548),
            ),
            _buildActionCard('Community', Icons.group, const Color(0xFF607D8B)),
            _buildActionCard('Mosque', Icons.mosque, const Color(0xFF673AB7)),
            _buildActionCard('Kitab', Icons.book, const Color(0xFFFF5722)),
            _buildActionCard(
              'Donate',
              Icons.volunteer_activism,
              const Color(0xFF3F51B5),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.format_quote,
                color: Color(0xFF00BCD4),
                size: 30,
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Hadith',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Learn a new hadith every day',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Sahih',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        if (title == 'Prayer\nTime') {
          Get.to(() => PrayerTimeView());
        } else if (title == 'Al-Qur\'an') {
          Get.to(() => const QuranView());
        } else if (title == 'Hadith') {
          Get.to(() => const HadithView());
        } else if (title == 'Dua') {
          Get.to(() => const DuaView());
        } else if (title == 'Qibla') {
          Get.to(() => const QiblaView());
        } else if (title == 'Tasbih') {
          Get.to(() => TasbihView());
        } else if (title == 'Zakat') {
          Get.to(() => ZakatView());
        } else if (title == 'Hijri') {
          Get.to(() => const HijriView());
        } else if (title == 'Community') {
          Get.to(() => const CommunityView());
        } else if (title == 'Mosque') {
          Get.to(() => const MosqueView());
        } else if (title == 'Kitab') {
          Get.to(() => const KitabView());
        } else if (title == 'Donate') {
          Get.to(() => const DonateView());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
