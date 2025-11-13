import 'package:flutter/material.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> newsList = [
    {
      "title": "🌤️ Cuaca Cerah di Seluruh Indonesia",
      "desc":
          "BMKG melaporkan cuaca cerah dan berawan di sebagian besar wilayah. Warga diimbau tetap gunakan sunscreen ya! ☀️",
      "image":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
    },
    {
      "title": "🐻 Boneka Lucu Jadi Tren Dekorasi Kamar Anak",
      "desc":
          "Orang tua kini ramai menghias kamar anak dengan boneka beruang pastel yang super gemas! 🧸",
      "image":
          "https://images.unsplash.com/photo-1592194996308-7b43878e84a6?auto=format&fit=crop&w=800&q=80",
    },
    {
      "title": "🌸 Warna Pastel Jadi Favorit Tahun Ini",
      "desc":
          "Desainer interior dan fashion menggunakan warna pastel untuk tampilan yang calm dan cozy 💐",
      "image":
          "https://images.unsplash.com/photo-1587300003388-59208cc962cb?auto=format&fit=crop&w=800&q=80",
    },
    {
      "title": "☕ Kafe Baru Bertema Lucu di Bandung",
      "desc":
          "‘Bear Coffee’ menarik perhatian dengan dekorasi beruang dan minuman dengan latte art imut! 🧋",
      "image":
          "https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildNewsCard(Map<String, String> news, int index) {
    final pastelColors = [
      const Color(0xFFFFF5E4), // pastel peach
      const Color(0xFFE3F2FD), // biru lembut
      const Color(0xFFFFF0F5), // pink lembut
      const Color(0xFFE8F5E9), // hijau muda
    ];

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: pastelColors[index % pastelColors.length],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                news["image"]!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news["desc"]!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      height: 1.5,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8EFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA8D8FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "📰 Berita Lucu Hari Ini",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicNeue',
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(newsList[index], index);
        },
      ),
    );
  }
}
