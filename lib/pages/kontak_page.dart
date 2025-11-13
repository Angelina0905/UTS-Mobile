import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> kontakList = [
      {'nama': 'Alya', 'nomor': '081234567890'},
      {'nama': 'Budi', 'nomor': '082112233445'},
      {'nama': 'Cici', 'nomor': '083812341234'},
      {'nama': 'Dewi', 'nomor': '085712345678'},
      {'nama': 'Eka', 'nomor': '081245678901'},
      {'nama': 'Fajar', 'nomor': '085812345678'},
      {'nama': 'Gina', 'nomor': '089612341234'},
      {'nama': 'Hadi', 'nomor': '081765432109'},
      {'nama': 'Indah', 'nomor': '081298765432'},
      {'nama': 'Joko', 'nomor': '083898989898'},
      {'nama': 'Kiki', 'nomor': '081234009876'},
      {'nama': 'Lina', 'nomor': '082198765432'},
      {'nama': 'Mira', 'nomor': '081267890123'},
      {'nama': 'Nina', 'nomor': '082134567890'},
      {'nama': 'Oka', 'nomor': '081212345678'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFD8EFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context); // kembali ke dashboard
          },
        ),
        title: const Text(
          "Daftar Kontak",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar lucu
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari nama kontak...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          // 🧸 Daftar Kontak
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: kontakList.length,
              itemBuilder: (context, index) {
                final kontak = kontakList[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.blue.shade100,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[100],
                        child: Text(
                          kontak['nama']![0],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      title: Text(
                        kontak['nama']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        kontak['nomor']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
