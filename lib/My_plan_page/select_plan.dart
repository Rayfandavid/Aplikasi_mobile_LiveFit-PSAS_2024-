import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workout_plan.dart'; // Import your WorkoutPlan model

class SelectPlanPage extends StatelessWidget {
  final List<WorkoutPlan> availablePlans = [
    WorkoutPlan(
      id: 1,
      name: 'Lean & Toned',
      description: 'A 4-day workout plan for beginners',
      workouts: [
        Workout(day: 'Monday', exercise: 'Push-ups', sets: 3, reps: 12),
        Workout(day: 'Tuesday', exercise: 'Squats', sets: 3, reps: 12),
        Workout(day: 'Thursday', exercise: 'Lunges', sets: 3, reps: 12),
        Workout(day: 'Friday', exercise: 'Plank', sets: 3, reps: 60),
      ],
    ),
    WorkoutPlan(
      id: 2,
      name: 'Intermediate Fitness',
      description: 'A 5-day workout plan for intermediate users',
      workouts: [
        Workout(day: 'Monday', exercise: 'Bench Press', sets: 3, reps: 12),
        Workout(day: 'Tuesday', exercise: 'Deadlifts', sets: 3, reps: 12),
        Workout(day: 'Wednesday', exercise: 'Bicep Curls', sets: 3, reps: 12),
        Workout(day: 'Thursday', exercise: 'Tricep Dips', sets: 3, reps: 12),
        Workout(day: 'Friday', exercise: 'Shoulder Press', sets: 3, reps: 12),
      ],
    ),
    WorkoutPlan(
      id: 3,
      name: 'Advanced Strength Training',
      description: 'A 6-day workout plan for advanced users',
      workouts: [
        Workout(day: 'Monday', exercise: 'Squat', sets: 4, reps: 8),
        Workout(day: 'Tuesday', exercise: 'Deadlift', sets: 4, reps: 8),
        Workout(day: 'Wednesday', exercise: 'Bench Press', sets: 4, reps: 8),
        Workout(day: 'Thursday', exercise: 'Pull-ups', sets: 4, reps: 10),
        Workout(day: 'Friday', exercise: 'Overhead Press', sets: 4, reps: 8),
        Workout(day: 'Saturday', exercise: 'Leg Press', sets: 4, reps: 10),
      ],
    ),
    WorkoutPlan(
      id: 4,
      name: 'Full Body HIIT',
      description: 'A high-intensity interval training plan for all levels',
      workouts: [
        Workout(day: 'Monday', exercise: 'Burpees', sets: 5, reps: 10),
        Workout(
            day: 'Wednesday', exercise: 'Mountain Climbers', sets: 5, reps: 30),
        Workout(day: 'Friday', exercise: 'Jump Squats', sets: 5, reps: 15),
      ],
    ),
    WorkoutPlan(
      id: 5,
      name: 'Cardio Blast',
      description: 'A 5-day cardio-focused workout plan',
      workouts: [
        Workout(
            day: 'Monday',
            exercise: 'Running',
            sets: 1,
            reps: 30), // 30 minutes
        Workout(
            day: 'Tuesday',
            exercise: 'Cycling',
            sets: 1,
            reps: 45), // 45 minutes
        Workout(
            day: 'Thursday',
            exercise: 'Jump Rope',
            sets: 5,
            reps: 1), // 5 sets of 1 minute
        Workout(
            day: 'Friday',
            exercise: 'Swimming',
            sets: 1,
            reps: 60), // 60 minutes
        Workout(
            day: 'Saturday',
            exercise: 'HIIT Sprints',
            sets: 5,
            reps: 30), // 5 sets of 30 seconds
      ],
    ),
    WorkoutPlan(
      id: 6,
      name: 'Yoga & Flexibility',
      description: 'A 7-day yoga and flexibility plan for relaxation',
      workouts: [
        Workout(
            day: 'Monday',
            exercise: 'Sun Salutations',
            sets: 1,
            reps: 10), // 10 rounds
        Workout(
            day: 'Tuesday',
            exercise: 'Warrior Pose',
            sets: 1,
            reps: 5), // 5 breaths per side
        Workout(
            day: 'Wednesday',
            exercise: 'Seated Forward Bend',
            sets: 1,
            reps: 5), // 5 breaths
        Workout(
            day: 'Thursday',
            exercise: 'Bridge Pose',
            sets: 1,
            reps: 5), // 5 breaths
        Workout(
            day: 'Friday',
            exercise: 'Child’s Pose',
            sets: 1,
            reps: 5), // 5 breaths
        Workout(
            day: 'Saturday',
            exercise: 'Cobra Pose',
            sets: 1,
            reps: 5), // 5 breaths
        Workout(
            day: 'Sunday',
            exercise: 'Meditation',
            sets: 1,
            reps: 15), // 15 minutes
      ],
    ),
    WorkoutPlan(
      id: 7,
      name: 'Strength & Endurance',
      description: 'A 5-day plan focusing on strength and endurance',
      workouts: [
        Workout(day: 'Monday', exercise: 'Deadlifts', sets: 4, reps: 10),
        Workout(day: 'Tuesday', exercise: 'Push-ups', sets: 4, reps: 15),
        Workout(
            day: 'Thursday', exercise: 'Kettlebell Swings', sets: 4, reps: 12),
        Workout(day: 'Friday', exercise: 'Box Jumps', sets: 4, reps: 10),
        Workout(
            day: 'Saturday',
            exercise: 'Rowing Machine',
            sets: 1,
            reps: 20), // 20 minutes
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select a Plan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: availablePlans.length,
        itemBuilder: (context, index) {
          final plan = availablePlans[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4,
            child: ListTile(
              title: Text(
                plan.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                plan.description,
                style: TextStyle(fontSize: 14),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context, plan); // Return the selected plan
              },
            ),
          );
        },
      ),
    );
  }
}
