import 'package:belajarflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Aplikasi menampilkan halaman login sebagai halaman awal', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Akun demo: admin / admin'), findsOneWidget);
  });

  testWidgets('Login menampilkan dialog saat kredensial tidak valid', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).first, 'salah');
    await tester.enterText(find.byType(TextField).last, 'salah');
    await tester.tap(find.widgetWithText(FilledButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Username dan Password Salah'), findsOneWidget);
  });
}
