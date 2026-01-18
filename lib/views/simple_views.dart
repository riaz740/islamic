import 'package:flutter/material.dart';

class SimpleInfoView extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;

  const SimpleInfoView({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 60, color: const Color(0xFF00BCD4)),
              ),
              const SizedBox(height: 30),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                content,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SimpleInfoView(
      title: 'Community',
      icon: Icons.group,
      content:
          'Join our vibrant Islamic community. Connect with brothers and sisters near you for prayer and events.',
    );
  }
}

class MosqueView extends StatelessWidget {
  const MosqueView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SimpleInfoView(
      title: 'Mosque Finder',
      icon: Icons.mosque,
      content:
          'Find nearby mosques, check prayer times, and see facilities available.',
    );
  }
}

class KitabView extends StatelessWidget {
  const KitabView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SimpleInfoView(
      title: 'Islamic Books',
      icon: Icons.book,
      content:
          'Access a library of authentic Islamic books and resources for learning.',
    );
  }
}

class DonateView extends StatelessWidget {
  const DonateView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SimpleInfoView(
      title: 'Donate',
      icon: Icons.volunteer_activism,
      content:
          'Support our cause. Your donations help us maintain the app and serve the community.\n\nBank: Islamic Bank\nAccount: 1234-5678-90',
    );
  }
}
