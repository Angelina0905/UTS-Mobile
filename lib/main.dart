import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 🧩 ini WAJIB buat date picker
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZLife',
      theme: ThemeData(
        fontFamily: 'ComicNeue',
        primaryColor: const Color(0xFFD8EFFF),
        scaffoldBackgroundColor: const Color(0xFFD8EFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD8EFFF),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // 🔹 Tambahkan ini biar DatePicker & Calendar gak error
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],

      home: const SplashScreen(),
    );
  }
}
