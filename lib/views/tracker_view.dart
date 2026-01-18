import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../controllers/tracker_controller.dart';

class TrackerView extends StatelessWidget {
  TrackerView({super.key});

  final TrackerController trackerController = Get.put(TrackerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tracker Score',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              // Info logic or dialog
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCalendar(),
            const SizedBox(height: 20),
            _buildPrayerTracker(),
            const SizedBox(height: 20),
            _buildScoreCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Obx(() {
      final selectedDate = trackerController.selectedDate.value;
      final daysInMonth = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        0,
      ).day;

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        trackerController.selectDate(
                          DateTime(
                            selectedDate.year,
                            selectedDate.month - 1,
                            1,
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        trackerController.selectDate(
                          DateTime(
                            selectedDate.year,
                            selectedDate.month + 1,
                            1,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: daysInMonth,
              itemBuilder: (context, index) {
                final day = index + 1;
                final currentDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  day,
                );
                final isSelected = day == selectedDate.day;

                return InkWell(
                  onTap: () {
                    trackerController.selectDate(currentDate);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF00BCD4)
                          : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$day',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPrayerTracker() {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prayer Tracker - ${DateFormat('dd MMM, yyyy').format(trackerController.selectedDate.value)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPrayerIcon('Fajr', Icons.wb_twilight),
                _buildPrayerIcon('Dhuhr', Icons.wb_sunny),
                _buildPrayerIcon('Asr', Icons.wb_cloudy),
                _buildPrayerIcon('Maghrib', Icons.nights_stay),
                _buildPrayerIcon('Isha', Icons.bedtime),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPrayerIcon(String name, IconData icon) {
    return Obx(() {
      final isCompleted = trackerController.isPrayerCompleted(name);
      return InkWell(
        onTap: () {
          trackerController.updatePrayerStatus(name);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xFF00BCD4) : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isCompleted ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Colors.black : Colors.grey,
                fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildScoreCards() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard(
                    'All Prayer',
                    trackerController.getOverallScore(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildScoreCard(
                    'Fajr',
                    trackerController.getPrayerScore('Fajr'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard(
                    'Dhuhr',
                    trackerController.getPrayerScore('Dhuhr'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildScoreCard(
                    'Asr',
                    trackerController.getPrayerScore('Asr'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard(
                    'Maghrib',
                    trackerController.getPrayerScore('Maghrib'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildScoreCard(
                    'Isha',
                    trackerController.getPrayerScore('Isha'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildScoreCard(String title, double percentage) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 8,
            percent: percentage / 100,
            center: Text(
              '${percentage.toInt()}%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            progressColor: const Color(0xFF00BCD4),
            backgroundColor: Colors.grey[200]!,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
