import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_a/main.dart';

void main() {
  testWidgets('Starts on the Home screen', (tester) async {
    await tester.pumpWidget(const LabAApp());

    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Each tab opens its own screen', (tester) async {
    await tester.pumpWidget(const LabAApp());

    await tester.tap(find.byIcon(Icons.alarm));
    await tester.pumpAndSettle();
    expect(find.text('Alarm Screen'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.business));
    await tester.pumpAndSettle();
    expect(find.text('Business Screen'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.school));
    await tester.pumpAndSettle();
    expect(find.text('School Screen'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
