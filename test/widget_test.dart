import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/main.dart';

void main() {
  testWidgets('Calculator Widget Addition Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('2'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('3'));
    await tester.tap(find.text('='));

    await tester.pump();

    expect(find.text('5'), findsOneWidget);
  });
}