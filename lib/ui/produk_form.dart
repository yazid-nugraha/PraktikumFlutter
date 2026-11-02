import 'package:belajarflutter/ui/produk_detail.dart';
import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void dispose() {
    _kodeProdukTextboxController.dispose();
    _namaProdukTextboxController.dispose();
    _hargaProdukTextboxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Produk')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _textboxKodeProduk(),
              _textboxNamaProduk(),
              _textboxHargaProduk(),
              const SizedBox(height: 16.0),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController,
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
    );
  }

  Widget _textboxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukTextboxController.text.trim();
        String namaProduk = _namaProdukTextboxController.text.trim();
        int? harga = int.tryParse(_hargaProdukTextboxController.text.trim());

        if (kodeProduk.isEmpty || namaProduk.isEmpty || harga == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Semua kolom wajib diisi dan Harga harus berupa angka!',
              ),
            ),
          );
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              harga: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }
}
