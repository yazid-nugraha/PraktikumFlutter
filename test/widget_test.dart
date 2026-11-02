import 'package:flutter_test/flutter_test.dart';
import 'package:belajarflutter/main.dart';

void main() {
  testWidgets('Menampilkan halaman List Data Produk sesuai modul', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Playstation'), findsOneWidget);
    expect(find.text('Radio'), findsOneWidget);
    expect(find.text('30000'), findsNWidgets(3));
  });
}
