import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tugas 3 - Penyimpanan Data Lokal',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _savedName = "";

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  // Ambil data dari SharedPreferences
  void _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('username') ?? "";
    });
  }

  // Simpan data ke SharedPreferences
  void _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    setState(() {
      _savedName = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tugas 3: SharedPreferences")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Masukkan Nama"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _saveName, child: const Text("Simpan")),
            const SizedBox(height: 20),
            Text(
              _savedName.isEmpty
                  ? "Belum ada nama tersimpan"
                  : "Nama tersimpan: $_savedName",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
