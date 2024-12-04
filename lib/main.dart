import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login&Regist/register_screen.dart';
import 'halaman_utama/MainPage.dart';
import 'pengisian_data/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const RegisterScreen(), 
    );
  }
}

class InitialProfilePage extends StatefulWidget {
  @override
  _InitialProfilePageState createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {
  String? name;
  String? gender;
  double? height;
  double? weight;
  DateTime? birthday;

  // Method to save profile
  void _saveProfile(String? newName, String? newGender, double? newHeight, double? newWeight, DateTime? newBirthday) {
    setState(() {
      name = newName;
      gender = newGender;
      height = newHeight;
      weight = newWeight;
      birthday = newBirthday;
    });

    

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(
          name: name,
          gender: gender,
          height: height,
          weight: weight,
          birthday: birthday,
        ),
      ),
    );
  }


  
   
  @override
  Widget build(BuildContext context) {
    return ProfilePage(
      onSaveProfile: _saveProfile, // Passing the callback function
      name: name,
      gender: gender,
      height: height,
      weight: weight,
      birthday: birthday,
    );
  }
}
