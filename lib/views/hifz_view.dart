import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../controllers/hifz_controller.dart';

class HifzView extends StatelessWidget {
  HifzView({super.key});

  final HifzController hifzController = Get.put(HifzController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Quran Memorizer',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressCard(),
          _buildTabBar(),
          Expanded(child: _buildSurahList()),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProgressIndicator(
                  'Hifz Progress',
                  hifzController.totalHifzProgress.value,
                ),
                _buildProgressIndicator(
                  'Surah Hifz',
                  hifzController.surahHifzProgress.value,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard('Juz Hifz', '0 / 30'),
              _buildStatCard('Ayah Hifz', '0 / 6236'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(String label, double percentage) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 50,
          lineWidth: 10,
          percent: percentage / 100,
          center: Text(
            '${percentage.toStringAsFixed(1)} %',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          progressColor: const Color(0xFF00BCD4),
          backgroundColor: Colors.grey[200]!,
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    // For now, only Surah tab is fully implemented as per requirements
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF00BCD4), width: 3),
                ),
              ),
              child: const Text(
                'Surah',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'Juz',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'Ayah',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurahList() {
    return Obx(
      () => ListView.builder(
        itemCount: hifzController.surahs.length,
        itemBuilder: (context, index) {
          final surah = hifzController.surahs[index];
          return InkWell(
            onTap: () {
              _showUpdateProgressDialog(
                context,
                surah.number,
                surah.nameEnglish,
                surah.memorizedAyah,
                surah.ayahCount,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Center(
                    child: Text(
                      '${surah.number}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                title: Text(
                  '${surah.number}. ${surah.nameArabic} | ${surah.nameEnglish}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayah Memorized: ${surah.memorizedAyah}/${surah.ayahCount}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Last Opened: ${surah.lastOpened != null ? "Today" : "Never"}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                trailing: CircularPercentIndicator(
                  radius: 25,
                  lineWidth: 5,
                  percent: surah.progressPercentage / 100,
                  center: Text(
                    '${surah.progressPercentage.toInt()}%',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: const Color(0xFF00BCD4),
                  backgroundColor: Colors.grey[200]!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUpdateProgressDialog(
    BuildContext context,
    int surahNumber,
    String surahName,
    int currentMemorized,
    int totalAyah,
  ) {
    final TextEditingController controller = TextEditingController(
      text: currentMemorized.toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Progress: $surahName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter number of Ayahs memorized:'),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixText: '/ $totalAyah',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Mark as fully completed
                hifzController.updateSurahProgress(surahNumber, totalAyah);
                Get.back();
              },
              child: const Text('Mark Completed'),
            ),
            ElevatedButton(
              onPressed: () {
                final int? value = int.tryParse(controller.text);
                if (value != null && value >= 0 && value <= totalAyah) {
                  hifzController.updateSurahProgress(surahNumber, value);
                  Get.back();
                } else {
                  Get.snackbar(
                    'Invalid Input',
                    'Please enter a valid number between 0 and $totalAyah',
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BCD4),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
