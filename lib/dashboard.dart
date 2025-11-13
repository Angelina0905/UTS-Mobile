import 'package:flutter/material.dart';
import 'pages/biodata.dart';
import 'pages/kontak_page.dart';
import 'pages/kalkulator.dart';
import 'pages/cuaca.dart';
import 'pages/berita.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
            // 🐻 Maskot lucu di tengah
            const SizedBox(height: 10),
            Image.asset(
              'assets/gambar/bear.png', // pastikan gambar maskot kamu ada di folder assets
              height: 160,
            ),
            const SizedBox(height: 10),

            // 👋 Sambutan
            const Text(
              'Hai, Angelina! ',
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
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 25),

            // 🌡️ Kartu info suhu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard(
                  icon: Icons.thermostat,
                  title: 'Suhu Maksimum',
                  value: '33°C',
                  color: Colors.redAccent,
                ),
                _infoCard(
                  icon: Icons.cloud_outlined,
                  title: 'Cuaca',
                  value: 'Cerah ',
                  color: Colors.blueAccent,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 📅 Kartu tambahan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard(
                  icon: Icons.calendar_today,
                  title: 'Tanggal',
                  value: '12 Nov 2025',
                  color: Colors.purpleAccent,
                ),
                _infoCard(
                  icon: Icons.mood,
                  title: 'Mood Hari Ini',
                  value: 'Happy 😊',
                  color: Colors.orangeAccent,
                ),
              ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
      ),
    );
  }

  // 🎀 Widget kecil untuk kartu info lucu
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
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
