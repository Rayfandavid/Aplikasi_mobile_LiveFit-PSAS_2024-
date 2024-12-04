import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "About",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Aplikasi ini dibuat untuk melengkapi tugas sumatif akhir semester 2024",
                style: GoogleFonts.poppins(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 13))
          ],
        ),
      ),
    );
  }
}
