import 'package:flutter/material.dart';
import 'package:app_pertama/list_profile.dart';
// Tambahkan dua import ini agar DetailProfile dan Profile dikenali
import 'package:app_pertama/profile_page.dart';
import 'package:app_pertama/models/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // Saat aplikasi dibuka, langsung ke ListProfile
      home: const ListProfile(),
    );
  }
}

// MyHomePage tetap di sini sebagai cadangan
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int step = 25;

  String namaWilliam = "Yehezkiel William";
  String nimWilliam = "2415354025";

  void _incrementCounter() => setState(() => _counter += step);
  
  void _decrementCounter() {
    if (_counter >= step) {
      setState(() => _counter -= step);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter tidak boleh negatif')),
      );
    }
  }

  void _resetCounter() => setState(() => _counter = 0);

  void _goToDetailProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailProfile(
         profile: Profile(
          id25: 0,
          name: namaWilliam,
          bio: "developer",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama: $namaWilliam', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('NIM: $nimWilliam', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementCounter, child: const Icon(Icons.add)),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: _decrementCounter, child: const Icon(Icons.remove)),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: _resetCounter, child: const Icon(Icons.refresh)),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _goToDetailProfile,
              child: const Text('Lihat Detail Profil'),
            ),
          ],
        ),
      ),
    );
  }
}