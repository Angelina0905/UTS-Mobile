import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8EFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/gambar/logo.png', width: 100, height: 100),
            const SizedBox(height: 10),
            const Text(
              'EZLife',
              style: TextStyle(
                fontFamily: 'ComicNeue',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 70,
              backgroundImage: const AssetImage('assets/gambar/profile2.jpg'),
              backgroundColor: Colors.blue[200],
            ),
            const SizedBox(height: 20),
            const Text(
              '152023077\nAngelina Geronsiana Yudrikewati',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ComicNeue',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
