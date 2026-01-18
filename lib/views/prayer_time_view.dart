import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/prayer_time_controller.dart';

class PrayerTimeView extends StatelessWidget {
  PrayerTimeView({super.key});

  final PrayerTimeController controller = Get.put(PrayerTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Prayer Time',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildLocationHeader(),
          _buildDateSelector(),
          const Divider(height: 1),
          _buildPrayerWestTimeHeader(),
          Expanded(child: _buildPrayerList()),
          _buildFullYearButton(),
        ],
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/mosque_icon.png',
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.mosque,
                      size: 60,
                      color: Color(0xFF00BCD4),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Now : ', style: TextStyle(fontSize: 16)),
                Text(
                  controller.selectedCity.value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      controller.currentTime.value,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.timeRemaining.value,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Length: Fajr: 5 Suhro 2',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Qibla Direction: North-West, 14:47',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: controller.previousDay,
          ),
          Obx(
            () => Text(
              controller.selectedDate.value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: controller.nextDay,
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerWestTimeHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Prayer',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(
            'West Time',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerList() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.prayers.length,
        itemBuilder: (context, index) {
          final prayer = controller.prayers[index];
          return _buildPrayerItem(
            prayer['name']!,
            prayer['startTime']!,
            prayer['endTime']!,
            prayer['icon']!,
            prayer['color']!,
          );
        },
      ),
    );
  }

  Widget _buildPrayerItem(
    String name,
    String startTime,
    String endTime,
    String iconName,
    String colorName,
  ) {
    IconData icon;
    Color color;

    switch (iconName) {
      case 'fajr':
        icon = Icons.wb_twilight;
        color = const Color(0xFFE91E63);
        break;
      case 'sunrise':
        icon = Icons.wb_sunny;
        color = const Color(0xFFFF9800);
        break;
      case 'dhuhr':
        icon = Icons.wb_sunny;
        color = const Color(0xFF2196F3);
        break;
      case 'asr':
        icon = Icons.wb_cloudy;
        color = const Color(0xFF4CAF50);
        break;
      case 'maghrib':
        icon = Icons.nights_stay;
        color = const Color(0xFF9C27B0);
        break;
      case 'isha':
        icon = Icons.bedtime;
        color = const Color(0xFF673AB7);
        break;
      default:
        icon = Icons.access_time;
        color = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            '$startTime - $endTime',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildFullYearButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to full year prayer times
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF00BCD4),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xFF00BCD4)),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 20),
            SizedBox(width: 8),
            Text(
              'See full year prayer time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
