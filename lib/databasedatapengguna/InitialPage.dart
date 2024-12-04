import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DatabaseInfo.dart';
import '../pengisian_data/ProfilePage.dart';
import '../halaman_utama/MainPage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool isProfileCompleted = false;

  @override
  void initState() {
    super.initState();
    _checkProfileStatus();
  }

  Future<void> _checkProfileStatus() async {
    // Check SharedPreferences for the profile completion status
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getBool('isProfileCompleted') ?? false;

    // If not completed, check if profile data exists in the database
    if (!completed) {
      final dbInfo = DatabaseInfo();
      final profile = await dbInfo.getProfile();
      if (profile != null) {
        await prefs.setBool('isProfileCompleted', true); // Mark as completed
        setState(() {
          isProfileCompleted = true;
        });
      }
    } else {
      setState(() {
        isProfileCompleted = true;
      });
    }
  }

  void _saveProfileStatus() async {
    // Mark profile as completed in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isProfileCompleted', true);
    setState(() {
      isProfileCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isProfileCompleted) {
      return MainPage(); // Navigate to Main Page if profile is completed
    } else {
      return ProfilePage(
        onSaveProfile: (name, gender, height, weight, birthday) {
          _saveProfileStatus(); // Mark profile as completed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
        },
      );
    }
  }
}