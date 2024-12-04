import 'package:flutter/material.dart';
import 'package:flutter_application_1/My_plan_page/workout_plan.dart';
import 'package:flutter_application_1/My_plan_page/workout_plandetailspage.dart';

class WorkoutPlanCard extends StatelessWidget {
  final WorkoutPlan workoutPlan;

  WorkoutPlanCard(this.workoutPlan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workoutPlan.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(workoutPlan.description),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Navigate to the details of the selected workout plan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutPlanDetailsPage(workoutPlan),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}