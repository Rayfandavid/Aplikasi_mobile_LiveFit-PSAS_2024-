import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth_services.dart';
import 'package:flutter_application_1/onboardscreen/onboarding_page.dart';
import 'package:flutter_application_1/Login&Regist/rounded_button.dart';
import 'package:flutter_application_1/Services/globals.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const OnboardingPage(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      title: const Text(
        'Login',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
    ),
    body: Center( // Center the entire body
      child: SingleChildScrollView( // Allow scrolling if the keyboard pops up
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill the width
            children: [
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 30),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () => loginPressed(),
              ),
              const SizedBox(height: 20), // Add some space below the button if needed
            ],
          ),
        ),
      ),
    ),
  );
}
}