# Praktikum Pemrograman Mobile — Flutter

## Identitas
- **Nama:** Muhammad Yazid Nugraha
- **NIM:** H1D024040
- **Shift KRS:** I

## Modul 2 — Flutter Widget and Design
### Hello World
<img src="screenshots/hello_world.png" width="260" />

### Widget Column
<img src="screenshots/column_widget.png" width="260" />

### Widget Row
<img src="screenshots/row_widget.png" width="260" />

### Form Produk
<img src="screenshots/produk_form.png" width="260" />

### Detail Produk
<img src="screenshots/produk_detail.png" width="260" />

### List Data Produk
<img src="screenshots/produk_page.png" width="260" />

## Modul 3 — Routes, Side Menu, Login, dan Local Storage

Implementasi Modul 3 menggunakan Flutter dan package `shared_preferences`.

### Fitur
- Halaman Login sebagai halaman awal aplikasi.
- Validasi input username dan password.
- Kredensial simulasi sesuai contoh Modul 3: **admin / admin**.
- Penyimpanan username ke local storage menggunakan `SharedPreferences`.
- Menampilkan username tersimpan pada halaman Home.
- Drawer / Side Menu dengan navigasi Home dan About.
- Logout yang menghapus username tersimpan dan kembali ke Login.

### Struktur file
```text
lib/
├── main.dart
└── pages/
    ├── login_page.dart
    ├── home_page.dart
    ├── side_menu.dart
    └── about_page.dart
```

### Menjalankan aplikasi
1. Pastikan Flutter SDK sudah terpasang.
2. Jalankan `flutter pub get`.
3. Jalankan `flutter run`.
4. Login menggunakan username `admin` dan password `admin`.
5. Buka Drawer untuk berpindah ke Home atau About.

> Catatan: autentikasi admin/admin hanya simulasi untuk praktikum, bukan sistem autentikasi produksi. Password tidak disimpan ke local storage.
