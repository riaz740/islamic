import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HijriView extends StatelessWidget {
  const HijriView({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    // Simplified estimation: Hijri year = (Gregorian Year - 622) * 33 / 32
    // This is just a rough estimate for display purposes without a dedicated package
    final hijriYear = ((now.year - 622) * 33 / 32).round();

    return Scaffold(
      backgroundColor: const Color(0xFF00BCD4),
      appBar: AppBar(
        title: const Text(
          'Hijri Calendar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('EEEE').format(now),
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    DateFormat('d MMMM').format(now),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text('Gregorian', style: TextStyle(color: Colors.grey)),
                  const Divider(height: 40),
                  const Text(
                    '19 Rajab', // Hardcoded/Estimated for demo
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                  Text(
                    '$hijriYear AH',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                  const Text('Hijri', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
