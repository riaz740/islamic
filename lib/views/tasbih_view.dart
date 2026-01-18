import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihController extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCount();
  }

  void increment() {
    count.value++;
    saveCount();
    // Add vibration here if package added
  }

  void reset() {
    count.value = 0;
    saveCount();
  }

  Future<void> saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tasbih_count', count.value);
  }

  Future<void> loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    count.value = prefs.getInt('tasbih_count') ?? 0;
  }
}

class TasbihView extends StatelessWidget {
  TasbihView({super.key});

  final TasbihController controller = Get.put(TasbihController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reset,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.count}',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BCD4),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: controller.increment,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00BCD4),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00BCD4).withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.touch_app,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Tap to Count',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
