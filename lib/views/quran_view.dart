import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart' as quran;

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Qur\'an', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          final surahNumber = index + 1;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF00BCD4).withValues(alpha: 0.1),
                child: Text(
                  '$surahNumber',
                  style: const TextStyle(color: Color(0xFF00BCD4)),
                ),
              ),
              title: Text(
                quran.getSurahNameEnglish(surahNumber),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${quran.getPlaceOfRevelation(surahNumber)} • ${quran.getSurahNameArabic(surahNumber)}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () =>
                  Get.to(() => SurahDetailView(surahNumber: surahNumber)),
            ),
          );
        },
      ),
    );
  }
}

class SurahDetailView extends StatelessWidget {
  final int surahNumber;

  const SurahDetailView({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    final verseCount = quran.getVerseCount(surahNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          quran.getSurahNameEnglish(surahNumber),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: verseCount,
        itemBuilder: (context, index) {
          final verseNumber = index + 1;
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: const Color(0xFF00BCD4),
                        child: Text(
                          '$verseNumber',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      // Add Basmala logic if needed (usually quran package includes it in first verse or handled separately)
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  quran.getVerse(surahNumber, verseNumber),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                    height: 2.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  quran.getVerseTranslation(surahNumber, verseNumber),
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
