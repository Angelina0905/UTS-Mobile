import 'package:flutter/material.dart';
import 'pages/biodata.dart';
import 'pages/kontak_page.dart';
import 'pages/kalkulator.dart';
import 'pages/cuaca.dart';
import 'pages/berita.dart';

class DashboardPage extends StatelessWidget {
  final String kondisiCuaca;
  final int suhu;

  const DashboardPage({
    super.key,
    this.kondisiCuaca = "Cerah", // default
    this.suhu = 33, // default
  });

  // 🌦️ Fungsi buat menentukan pesan berdasarkan cuaca
  String getPesanCuaca() {
    if (kondisiCuaca.toLowerCase().contains("hujan")) {
      return "Hari ini hujan 🌧️\nJangan lupa bawa payung ya!";
    } else if (kondisiCuaca.toLowerCase().contains("berawan")) {
      return "Langit agak berawan ☁️\nTetap semangat beraktivitas!";
    } else if (suhu > 32) {
      return "Hari ini panas banget 🔥\nBanyak minum air putih ya 💧";
    } else if (suhu < 25) {
      return "Udara cukup dingin 🧣\nJaga kesehatan ya!";
    } else {
      return "Cuacanya nyaman hari ini 😄\nNikmati harimu!";
    }
  }

  void _navigateToPage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const KontakPage();
        break;
      case 1:
        page = const KalkulatorPage();
        break;
      case 2:
        page = const BiodataPage();
        break;
      case 3:
        page = const CuacaPage();
        break;
      case 4:
        page = const BeritaPage();
        break;
      default:
        page = const KontakPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pesan = getPesanCuaca();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'EZLife Dashboard 🧸',
          style: TextStyle(
            fontFamily: 'ComicNeue',
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/gambar/bear.png', height: 160),
            const SizedBox(height: 10),

            const Text(
              'Hai, Angelina!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Semangat hari ini ya 💪\nYuk cek info seru di bawah!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 25),

            // 🌡️ Info suhu dan cuaca
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard(
                  icon: Icons.thermostat,
                  title: 'Suhu Maksimum',
                  value: '$suhu°C',
                  color: Colors.redAccent,
                ),
                _infoCard(
                  icon: Icons.cloud_outlined,
                  title: 'Cuaca',
                  value: kondisiCuaca,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            const SizedBox(height: 25),

            // 🧩 Grid cuaca motivasi
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "🌤️ Info Cuaca & Pesan Hari Ini",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD8EFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      pesan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFAEC9FF),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) => _navigateToPage(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Cuaca'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
        ],
      ),
    );
  }

  // 🩵 Widget kartu kecil
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
