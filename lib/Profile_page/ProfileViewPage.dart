import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile_page/AboutPage.dart';
import 'package:flutter_application_1/Profile_page/PersonalInfoPage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewPage extends StatelessWidget {
  final String? name;
  final String? gender;
  final double? height;
  final double? weight;
  final DateTime? birthday;

  const ProfileViewPage({
    Key? key,
    this.name,
    this.gender,
    this.height,
    this.weight,
    this.birthday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Text(
          "Me",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ring and statistics section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Calories",
                            style: TextStyle(color: Colors.orange)),
                        const Text("0",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 24)),
                        const SizedBox(height: 10),
                        const Text("Workout",
                            style: TextStyle(color: Colors.green)),
                        const Text("0",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 24)),
                        const SizedBox(height: 10),
                        const Text("Minutes",
                            style: TextStyle(color: Colors.blue)),
                        const Text("0",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 24)),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Center(
                        child: Text(
                          "R",
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Log in/Register Section
                  ListTile(
                    leading: Icon(Icons.account_circle,
                        size: 40, color: Colors.blueAccent),
                    title: Text(
                      "Log in/Register",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Handle log in/register action
                    },
                  ),
                  const SizedBox(height: 20),

                  // Personal Info Section
                  ListTile(
                    title: Text(
                      "Personal Info",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                    onTap: () {
                      // Navigate to Personal Info page and pass data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoPage(
                            name: name,
                            gender: gender,
                            height: height,
                            weight: weight,
                            birthday: birthday,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  // About Section
                  ListTile(
                    title: Text(
                      "About",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                    onTap: () {
                      // Navigate to About page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
