 import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiTernak());
}

class AplikasiTernak extends StatelessWidget {
  const AplikasiTernak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const FormPencatatan(),
    );
  }
}

class FormPencatatan extends StatefulWidget {
  const FormPencatatan({super.key});

  @override
  State<FormPencatatan> createState() => _FormPencatatanState();
}

class _FormPencatatanState extends State<FormPencatatan> {
  final _controllerMati = TextEditingController();
  final _controllerPakan = TextEditingController();
  int _jumlahMati = 0;
  int _jumlahPakan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sahabat Peternak - Input Harian'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Formulir Data Kandang', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerMati,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Unggas Mati (Ekor)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerPakan,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Pakan Habis (Kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  _jumlahMati = int.tryParse(_controllerMati.text) ?? 0;
                  _jumlahPakan = int.tryParse(_controllerPakan.text) ?? 0;
                });
              },
              child: const Text('Simpan & Hitung', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 30),
            const Text('Data Terbaca Saat Ini:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Ayam Mati: $_jumlahMati ekor', style: const TextStyle(fontSize: 16)),
            Text('Konsumsi Pakan: $_jumlahPakan Kg', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
