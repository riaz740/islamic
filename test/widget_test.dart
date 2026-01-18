// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islamic/controllers/settings_controller.dart';
import 'package:islamic/views/main_view.dart';

void main() {
  testWidgets('MainView has bottom navigation items', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    Get.put(SettingsController());

    await tester.pumpWidget(GetMaterialApp(home: MainView()));

    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Tracker'), findsOneWidget);
    expect(find.text('Hifz'), findsOneWidget);
    expect(find.text('Education'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
