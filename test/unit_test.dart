import 'package:flutter_test/flutter_test.dart';
import 'package:quickdigits/main.dart';
import 'package:quickdigits/calculator.dart';

void main() {
  testWidgets('Calculator App Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the Calculator widget is rendered.
    expect(find.byType(Calculator), findsOneWidget);

    // Example: Test button press and verify the result.
    await tester.tap(find.text('1'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('2'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
  });
}
