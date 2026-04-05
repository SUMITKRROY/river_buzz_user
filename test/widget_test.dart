import 'package:flutter_test/flutter_test.dart';
import 'package:river_buzz_user/main.dart';

void main() {
  testWidgets('Splash screen loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RiverBuzzApp());

    // Verify that the splash screen shows "River Buzz"
    expect(find.text('River Buzz'), findsOneWidget);
  });
}
