import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  String today = '';
  String kondisi = 'Cerah';
  double suhu = 28.5;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null).then((_) {
      setState(() {
        today = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
      });
    });
  }

  // 🔹 Gambar cuaca berdasarkan kondisi
  String getGambarCuaca(String kondisi) {
    switch (kondisi) {
      case 'Cerah':
        return 'assets/gambar/cuaca/cerah.png';
      case 'Berawan':
        return 'assets/gambar/cuaca/berawan.png';
      case 'Hujan':
        return 'assets/gambar/cuaca/hujan.png';
      case 'Petir':
        return 'assets/gambar/cuaca/petir.png';
      case 'Mendung':
        return 'assets/gambar/cuaca/mendung.png';
      default:
        return 'assets/gambar/cuaca/berawan.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> forecast = [
      {'day': 'Senin', 'desc': 'Cerah', 'temp': '30°C'},
      {'day': 'Selasa', 'desc': 'Berawan', 'temp': '27°C'},
      {'day': 'Rabu', 'desc': 'Hujan', 'temp': '25°C'},
      {'day': 'Kamis', 'desc': 'Petir', 'temp': '26°C'},
      {'day': 'Jumat', 'desc': 'Mendung', 'temp': '28°C'},
      {'day': 'Sabtu', 'desc': 'Cerah', 'temp': '31°C'},
      {'day': 'Minggu', 'desc': 'Hujan', 'temp': '24°C'},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          "EZLife Weather ☀️",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'ComicNeue',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9AD0EC),
              Color(0xFF74ABE2),
              Color(0xFF5583EE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: today.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 110, 16, 30),
                child: Column(
                  children: [
                    // 🌤️ Gambar Cuaca
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutBack,
                      child: Image.asset(
                        getGambarCuaca(kondisi),
                        width: 180,
                        height: 180,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔹 Info Utama Cuaca
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white30, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Bandung",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'ComicNeue',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${suhu.toStringAsFixed(1)}°C",
                            style: const TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'ComicNeue',
                            ),
                          ),
                          Text(
                            kondisi,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            today,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 🔹 Daftar prakiraan mingguan
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white30, width: 1),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              "📅 Prakiraan Mingguan",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'ComicNeue',
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: forecast.length,
                            itemBuilder: (context, index) {
                              var data = forecast[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          getGambarCuaca(data['desc']),
                                          width: 35,
                                          height: 35,
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['day'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              data['desc'],
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data['temp'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
