import 'package:flutter_test/flutter_test.dart';
import 'package:abdallah_ali_rehab_portfolio/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // Verify that the title and role are present.
    expect(find.text('Abdallah Ali Rehab'), findsOneWidget);
    expect(find.text('Senior Mobile Developer'), findsWidgets);
  });
}
