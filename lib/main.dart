import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData.dark(),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0E21), Color(0xFF1B2C4A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                ProfileSection(), // gabungan foto + info
                SizedBox(height: 20),
                HobbySection(),
                SizedBox(height: 20),
                AboutSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Bagian Foto dan Info Profile
class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("foto/persona3.jpg"),
              ),
              SizedBox(height: 8),
              Text(
                "8 Desember 2002",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Nama + Info lainnya
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Persona",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent),
                ),
                SizedBox(height: 12),
                InfoRow(icon: Icons.email, value: "nama@email.com"),
                InfoRow(icon: Icons.phone, value: "0812-3456-7890"),
                InfoRow(icon: Icons.location_on,value: "Kota Samarinda, Kalimantan Timur"),
                InfoRow(icon: Icons.account_balance, value: "1234-5678-9101"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const InfoRow({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyanAccent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bagian Hobby
class HobbySection extends StatelessWidget {
  const HobbySection({super.key});

  @override
  Widget build(BuildContext context) {
    final hobbies = [
      {"icon": Icons.music_note,"title": "Musik","desc": "Jazz, Funk, Pop, Electronic, Ambient, Trance"},
      {"icon": Icons.games,"title": "Game","desc": "Arknights, HOK, Seven Knights Rebirth, Delta Force"},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Hobi",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          for (var h in hobbies)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(h["icon"] as IconData, color: Colors.cyanAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(h["title"] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white)),
                        const SizedBox(height: 4),
                        Text(h["desc"] as String,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Bagian About Me
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          SizedBox(height: 8),
          Text("Saya suka musik, game, dan hal-hal futuristik.\n"
             "Motto hidup: Keep learning, keep growing.\n"
             "\n"
             "Saat ini saya berfokus pada bidang data "
             "dan saya ingin bekerja menjadi Data Scientist atau Ahli Data. "
             "Saya tertarik untuk mengolah data menjadi informasi yang bermanfaat, "
             "serta terus belajar teknologi baru di dunia analisis data dan AI.",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
