import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/calculator.dart';

void main() {
  testWidgets('Calculator Integration Test', (WidgetTester tester) async {
    // Build the calculator widget
    await tester.pumpWidget(Calculator());

    // Find the buttons by their text
    final button1 = find.widgetWithText(OutlinedButton, '1');
    final button2 = find.widgetWithText(OutlinedButton, '2');
    final buttonPlus = find.widgetWithText(OutlinedButton, '+');
    final buttonEquals = find.widgetWithText(OutlinedButton, '=');

    // Tap the buttons
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(buttonEquals);
    await tester.pump();

    // Find the result text widget
    final resultText = find.descendant(
      of: find.byType(Calculator),
      matching: find.text('3'),
    );

    // Verify the result is as expected
    expect(resultText, findsOneWidget);
  });
}
