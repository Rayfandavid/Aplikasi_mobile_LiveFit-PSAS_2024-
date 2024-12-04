import 'package:flutter/material.dart'; // Import the new page
import 'package:flutter_application_1/My_plan_page/select_plan.dart';
import 'package:flutter_application_1/My_plan_page/workout_plan_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workout_plan.dart'; // Ensure this imports your WorkoutPlan model

class MyPlanPage extends StatefulWidget {
  @override
  _MyPlanPageState createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  WorkoutPlan? currentPlan;

  @override
  void initState() {
    super.initState();
    // Set a default plan or load from a database
    currentPlan = WorkoutPlan(
      id: 1,
      name: 'Beginner Fitness',
      description: 'A 4-day workout plan for beginners',
      workouts: [
        Workout(day: 'Monday', exercise: 'Push-ups', sets: 3, reps: 12),
        Workout(day: 'Tuesday', exercise: 'Squats', sets: 3, reps: 12),
        Workout(day: 'Thursday', exercise: 'Lunges', sets: 3, reps: 12),
        Workout(day: 'Friday', exercise: 'Plank', sets: 3, reps: 60),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Plan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
         // Change the AppBar color
      ),
      body: ListView(
        padding: EdgeInsets.all(16), // Add padding to the ListView
        children: [
          // Header section
          Text(
            'Your Current Plan',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 16), // Add space between header and content

          // Display current plan details
          if (currentPlan != null) ...[
            WorkoutPlanCard(currentPlan!),
          ] else ...[
            Text(
              'No current plan selected.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],

          SizedBox(height: 24), // Add space before the button

          // Call to action button
          ElevatedButton(
            onPressed: () async {
              // Navigate to plan selection page
              final selectedPlan = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectPlanPage()),
              );

              // Update the current plan if a plan was selected
              if (selectedPlan != null) {
                setState(() {
                  currentPlan = selectedPlan;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const  Color.fromARGB(255, 11, 117, 204), // Button color
              padding: EdgeInsets.symmetric(vertical: 16), // Button padding
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Text('Change Plan',
            style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
}