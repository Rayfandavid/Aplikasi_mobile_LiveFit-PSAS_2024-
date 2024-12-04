import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login&Regist/login_screen.dart';
import 'package:flutter_application_1/Services/auth_services.dart';
import 'package:flutter_application_1/Services/globals.dart';
import 'package:google_fonts/google_fonts.dart';

import 'rounded_button.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _name = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
          await AuthServices.register(_name, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>  const LoginScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      title: Container( // Use Container for the AppBar title
        alignment: Alignment.center, // Center the text within the container
        child: Text(
          'Registration',
          style: GoogleFonts.poppins(
            color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      toolbarHeight: 60, // Adjust height if needed
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
                  hintText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                onChanged: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
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
                  hintText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 40),
              RoundedButton(
                btnText: 'Create Account',
                onBtnPressed: () => createAccountPressed(),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}