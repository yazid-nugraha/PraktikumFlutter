import 'package:belajarflutter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login page is shown when the app starts', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Masukkan Username'), findsOneWidget);
    expect(find.text('Masukkan Password'), findsOneWidget);
  });
}
