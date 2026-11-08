import 'package:flutter/material.dart';
import 'package:belajarflutter/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Menyimpan username ke local storage.
  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  // Membuat input username dan password sesuai contoh Modul 3.
  Widget _showInput(
    TextEditingController namaController,
    String placeholder,
    bool isPassword,
  ) {
    return TextField(
      controller: namaController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  // Menampilkan alert dan mengarahkan pengguna ke halaman tujuan.
  _showDialog(String pesan, Widget alamat) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => alamat),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Username', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  _saveUsername();
                  // Menampilkan alert login berhasil.
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  // Menampilkan alert jika username atau password salah.
                  _showDialog(
                    'Username dan Password Salah',
                    const LoginPage(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
