import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZakatController extends GetxController {
  final savingsController = TextEditingController();
  final goldController = TextEditingController();
  final silverController = TextEditingController();
  var totalZakat = 0.0.obs;

  void calculate() {
    double savings = double.tryParse(savingsController.text) ?? 0;
    double gold = double.tryParse(goldController.text) ?? 0;
    double silver = double.tryParse(silverController.text) ?? 0;

    // Simplified calculation: 2.5% of total assets
    // In reality, gold/silver have specific nisab thresholds
    double totalAssets = savings + gold + silver;
    totalZakat.value = totalAssets * 0.025;
  }

  void reset() {
    savingsController.clear();
    goldController.clear();
    silverController.clear();
    totalZakat.value = 0.0;
  }
}

class ZakatView extends StatelessWidget {
  ZakatView({super.key});

  final ZakatController controller = Get.put(ZakatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zakat Calculator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reset,
            tooltip: 'Reset',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInputCard(
              'Cash / Savings',
              'Enter amount',
              controller.savingsController,
            ),
            _buildInputCard(
              'Gold Value',
              'Enter value',
              controller.goldController,
            ),
            _buildInputCard(
              'Silver Value',
              'Enter value',
              controller.silverController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BCD4),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Calculate Zakat',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF00BCD4).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF00BCD4)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Zakat Payable',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      controller.totalZakat.value.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00BCD4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Note: This is a simplified calculator. Zakat is 2.5% of eligible wealth held for a lunar year above the Nisab threshold.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard(
    String title,
    String hint,
    TextEditingController controller,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
