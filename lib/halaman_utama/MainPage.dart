import 'package:flutter/material.dart';
import 'package:flutter_application_1/My_plan_page/myplan_page.dart';
import 'package:flutter_application_1/Calorie_counter/CalorieCounterPage.dart';
import 'package:flutter_application_1/Profile_page/ProfileViewPage.dart';
import 'package:flutter_application_1/halaman_workout/WorkoutPage.dart';

class MainPage extends StatefulWidget {
  final String? name;
  final String? gender;
  final double? height;
  final double? weight; // weight data passed here
  final DateTime? birthday;

  const MainPage({
    Key? key,
    this.name,
    this.gender,
    this.height,
    this.weight,
    this.birthday,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      WorkoutPage(),
      MyPlanPage(),
      CalorieCounterPage(),
      ProfileViewPage(
        name: widget.name,
        gender: widget.gender,
        height: widget.height,
        weight: widget.weight,
        birthday: widget.birthday,
      ),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor:  Colors.blueAccent,
        unselectedItemColor: Colors.grey[700],
        unselectedLabelStyle: TextStyle(color: Colors.blueAccent),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), // Icon untuk halaman Workout
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // Ikon untuk Summary
            label: 'My Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_sharp), // Ikon untuk Calorie Counter
            label: 'Calorie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),  // Ikon untuk Profile
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}