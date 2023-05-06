import 'package:flutter_test/flutter_test.dart';
import 'package:fridger_app/main.dart';
import 'package:fridger_app/ui/screens/login_screen.dart';

void main() {
  testWidgets('MyApp builds correctly', (WidgetTester tester) async {
    // Build the MyApp widget
    await tester.pumpWidget(const MyApp());

    // Verify that the title is displayed correctly
    expect(find.textContaining('Fridger Alpha'), findsOneWidget);

    // Verify that the LoginScreen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
