import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String userInput = '';
  String result = '0';

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '=',
  ];

  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        userInput = '';
        result = '0';
      } else if (text == 'DEL') {
        userInput = userInput.isNotEmpty
            ? userInput.substring(0, userInput.length - 1)
            : '';
      } else if (text == '=') {
        _calculateResult();
      } else {
        userInput += text;
      }
    });
  }

  void _calculateResult() {
    try {
      String finalInput = userInput.replaceAll('×', '*');
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toStringAsFixed(eval.truncateToDouble() == eval ? 0 : 2);
    } catch (e) {
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8EFFF), // 💙 pastel biru muda
      appBar: AppBar(
        backgroundColor: const Color(0xFFA8D8FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '🧮 Kalkulator Pastel',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicNeue',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),

          // 🔹 Layar Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                userInput,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontFamily: 'ComicNeue',
                ),
              ),
            ),
          ),

          // 🔹 Layar Hasil
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'ComicNeue',
              ),
            ),
          ),
          const SizedBox(height: 15),

          // 🔹 Grid Tombol
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFA8D8FF), // 💙 pastel lembut
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final btn = buttons[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed(btn),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: _getButtonColor(btn),
                        padding: const EdgeInsets.all(22),
                        elevation: 3,
                        shadowColor: Colors.blue.shade100,
                      ),
                      child: Text(
                        btn,
                        style: TextStyle(
                          fontSize: 24,
                          color: _getTextColor(btn),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicNeue',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🎨 Warna tombol disesuaikan
  Color _getButtonColor(String text) {
    if (text == 'C') return const Color(0xFFFFB6B6); // merah pastel
    if (text == 'DEL') return const Color(0xFFFFD3B6); // oranye pastel
    if (text == '=') return const Color(0xFFB6E2A1); // hijau pastel
    if (['+', '-', '×', '/', '%'].contains(text)) {
      return const Color(0xFFB5D9FF); // biru pastel lembut
    }
    return const Color(0xFFFFFFFF); // putih untuk angka
  }

  Color _getTextColor(String text) {
    if (['C', 'DEL', '='].contains(text)) return Colors.black;
    if (['+', '-', '×', '/', '%'].contains(text)) return Colors.black87;
    return Colors.black;
  }
}
