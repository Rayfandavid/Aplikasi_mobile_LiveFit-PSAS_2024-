import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoPage extends StatelessWidget {
  final String? name;
  final String? gender;
  final double? height;
  final double? weight;
  final DateTime? birthday;

  const PersonalInfoPage({
    super.key,
    this.name,
    this.gender,
    this.height,
    this.weight,
    this.birthday,
  });

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Personal Info",
        style: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 0, 0, 0), // Set text color to orange
          fontWeight: FontWeight.bold,
        ),
      ),
      shadowColor: const Color.fromARGB(255, 185, 74, 0),
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildInfoRow("Name", name ?? 'Not available'),
          _buildInfoRow("Gender", gender ?? 'Not available'),
          _buildInfoRow("Height", "${height ?? 'Not available'} cm"),
          _buildInfoRow("Weight", "${weight ?? 'Not available'} kg"),
          _buildInfoRow(
            "Birthday",
            birthday != null ? birthday!.toLocal().toString() : 'Not available',
          ),
        ],
      ),
    ),
  );
}


  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 0, 0), // Orange text for labels
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent, // White text for values on dark background
            ),
          ),
        ],
      ),
    );
  }
}
