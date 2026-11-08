import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about_page.dart';
import 'login_page.dart';
import 'side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final preferences = await SharedPreferences.getInstance();
    final savedUsername = preferences.getString('username') ?? 'Pengguna';
    if (!mounted) return;
    setState(() => _username = savedUsername);
  }

  Future<void> _logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('username');
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 36,
                child: Icon(Icons.person, size: 38),
              ),
              const SizedBox(height: 16),
              Text(
                'Halo, $_username!',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Ini adalah halaman Home pengguna yang berhasil login.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const AboutPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('Tentang Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
