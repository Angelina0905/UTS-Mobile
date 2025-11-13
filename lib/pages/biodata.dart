import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String? _selectedGender;
  String? _selectedHobby;
  DateTime? _selectedDate;
  String? _formattedDate;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formattedDate =
            DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8EFFF), // 💙 biru pastel lembut
      appBar: AppBar(
        backgroundColor: const Color(0xFFA8D8FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Biodata Pastel 🧸",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicNeue',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            // 🔹 FOTO & NAMA
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFA8D8FF),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/gambar/profile.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Angelina",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  const Text(
                    "Mahasiswa Informatika",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB6E2A1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "152023077",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicNeue',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 FORM BIODATA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Isi Biodata Diri 💫",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nama Lengkap
                  _buildTextField(
                    controller: _nameController,
                    label: "Nama Lengkap",
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 15),

                  // Alamat
                  _buildTextField(
                    controller: _addressController,
                    label: "Alamat",
                    icon: Icons.home,
                  ),
                  const SizedBox(height: 15),

                  // Jenis Kelamin
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      prefixIcon: const Icon(Icons.wc, color: Colors.black54),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    value: _selectedGender,
                    items: const [
                      DropdownMenuItem(
                          value: "Laki-laki", child: Text("Laki-laki")),
                      DropdownMenuItem(
                          value: "Perempuan", child: Text("Perempuan")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  const SizedBox(height: 15),

                  // Hobi
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF2D8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.orange.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hobi:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicNeue',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildHobbyOption("Membaca"),
                            _buildHobbyOption("Olahraga"),
                            _buildHobbyOption("Musik"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Tanggal Lahir
                  TextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: _formattedDate ?? ''),
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      prefixIcon:
                          const Icon(Icons.calendar_month, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.pink.shade50,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Tombol Simpan
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Data berhasil diisi (tidak disimpan ke DB)"),
                          backgroundColor: Color(0xFFB6E2A1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(Icons.check, color: Colors.black87),
                    label: const Text("Simpan Biodata"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB6E2A1),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget Reusable Input Field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  // Widget Pilihan Hobi
  Widget _buildHobbyOption(String hobby) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: hobby,
          groupValue: _selectedHobby,
          activeColor: const Color(0xFFB5D9FF),
          onChanged: (value) {
            setState(() {
              _selectedHobby = value;
            });
          },
        ),
        Text(hobby, style: const TextStyle(fontFamily: 'ComicNeue')),
      ],
    );
  }
}
