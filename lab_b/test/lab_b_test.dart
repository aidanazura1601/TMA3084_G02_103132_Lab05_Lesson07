import 'package:flutter_test/flutter_test.dart';
import 'package:lab_b/main.dart';

/// True when [first] is shown above [second] in the table.
bool isAbove(WidgetTester tester, String first, String second) {
  return tester.getTopLeft(find.text(first)).dy <
      tester.getTopLeft(find.text(second)).dy;
}

void main() {
  testWidgets('Shows all three cars in the default order', (tester) async {
    await tester.pumpWidget(const LabBApp());

    for (final car in initialCars) {
      expect(find.text(car.carMake), findsOneWidget);
    }
    expect(isAbove(tester, 'Honda', 'Toyota'), isTrue);
    expect(isAbove(tester, 'Toyota', 'BMW'), isTrue);
  });

  testWidgets('Sorts by Car Make ascending', (tester) async {
    await tester.pumpWidget(const LabBApp());

    await tester.tap(find.text('Car Make'));
    await tester.pumpAndSettle();

    expect(isAbove(tester, 'BMW', 'Honda'), isTrue);
    expect(isAbove(tester, 'Honda', 'Toyota'), isTrue);
  });

  testWidgets('Sorts by Model ascending', (tester) async {
    await tester.pumpWidget(const LabBApp());

    await tester.tap(find.text('Model'));
    await tester.pumpAndSettle();

    expect(isAbove(tester, '2010', '2011'), isTrue);
    expect(isAbove(tester, '2011', '2021'), isTrue);
  });

  testWidgets('Sorts by Price ascending, then descending', (tester) async {
    await tester.pumpWidget(const LabBApp());

    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();
    expect(isAbove(tester, 'Toyota', 'BMW'), isTrue);
    expect(isAbove(tester, 'BMW', 'Honda'), isTrue);

    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();
    expect(isAbove(tester, 'Honda', 'BMW'), isTrue);
    expect(isAbove(tester, 'BMW', 'Toyota'), isTrue);
  });
}
