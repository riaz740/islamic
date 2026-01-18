import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/mock_data.dart';
import 'education_details_view.dart';
import 'simple_views.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  static final List<Map<String, dynamic>> _topics = [
    {
      'title': 'Asma Ul Husna',
      'icon': Icons.mosque,
      'color': const Color(0xFF00BCD4),
    },
    {
      'title': 'Ayatul Kursi',
      'icon': Icons.book,
      'color': const Color(0xFF9C27B0),
    },
    {
      'title': 'Shahadah',
      'icon': Icons.fingerprint,
      'color': const Color(0xFF009688),
    },
    {'title': 'Salah', 'icon': Icons.person, 'color': const Color(0xFF673AB7)},
    {
      'title': 'Sunnah',
      'icon': Icons.wb_sunny,
      'color': const Color(0xFFFF9800),
    },
    {
      'title': 'Ablution',
      'icon': Icons.water_drop,
      'color': const Color(0xFF2196F3),
    },
    {
      'title': 'Prayer Rakats',
      'icon': Icons.calendar_view_day,
      'color': const Color(0xFF4CAF50),
    },
    {
      'title': 'Printed Quran',
      'icon': Icons.menu_book,
      'color': const Color(0xFFE91E63),
    },
    {
      'title': 'Zakat',
      'icon': Icons.monetization_on,
      'color': const Color(0xFFFF5722),
    },
    {'title': 'Hajj', 'icon': Icons.place, 'color': const Color(0xFF795548)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Deen Education',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemCount: _topics.length,
          itemBuilder: (context, index) {
            final topic = _topics[index];
            return _buildEducationCard(
              topic['title'] as String,
              topic['icon'] as IconData,
              topic['color'] as Color,
            );
          },
        ),
      ),
    );
  }

  Widget _buildEducationCard(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        if (title == 'Asma Ul Husna') {
          Get.to(() => const AsmaUlHusnaView());
        } else if (title == 'Ayatul Kursi') {
          Get.to(() => const AyatulKursiView());
        } else {
          // Find mock content or use default
          final content = MockData.educationContent.firstWhere(
            (e) => e['title'] == title,
            orElse: () => {
              'title': title,
              'content':
                  'Educational content for $title will be available soon.',
            },
          );

          Get.to(
            () => SimpleInfoView(
              title: title,
              icon: icon,
              content: content['content'],
            ),
          );
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 40),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
