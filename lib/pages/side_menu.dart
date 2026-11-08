import 'package:flutter/material.dart';

import 'about_page.dart';
import 'home_page.dart';

/// Drawer navigasi untuk berpindah antara Home dan About.
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Side Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => _openPage(context, const HomePage()),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () => _openPage(context, const AboutPage()),
          ),
        ],
      ),
    );
  }
}
