import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final List<Map<String, dynamic>> workouts = [
  {
    "name": "Running",
    "description": "Improve your endurance with a steady-paced run.",
    "icon": Icons.directions_run,
    "duration": "30 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Maintain a steady pace and focus on your breathing."
  },
  {
    "name": "Walking",
    "description": "A low-impact exercise to enhance cardiovascular health.",
    "icon": Icons.directions_walk,
    "duration": "30 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Keep your shoulders relaxed and swing your arms."
  },
  {
    "name": "Jump Rope",
    "description": "A fun way to improve your coordination and endurance.",
    "icon": Icons.arrow_upward,
    "duration": "15 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Keep your elbows close to your body and jump on the balls of your feet."
  },
  {
    "name": "Squat Jump",
    "description": "A powerful exercise to build strength and explosiveness.",
    "icon": Icons.directions_run,
    "duration": "30 sec",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Land softly and keep your knees aligned with your toes."
  },
  {
    "name": "Jumping Jacks",
    "description": "A full-body workout to get your heart rate up.",
    "icon": Icons.directions_run,
    "duration": "1 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Keep a steady rhythm and maintain good posture."
  },
  {
    "name": "Plank",
    "description": "Engage your core for stability and strength.",
    "icon": Icons.directions_run,
    "duration": "30 sec",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Keep your body in a straight line from head to heels."
  },
  {
    "name": "Cycling",
    "description": "A great workout for cardio and leg strength.",
    "icon": Icons.directions_bike,
    "duration": "45 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Maintain a steady cadence and adjust your seat height for comfort."
  },
  {
    "name": "Swimming",
    "description": "A full-body workout that’s easy on the joints.",
    "icon": Icons.pool,
    "duration": "60 min",
    "category": "Cardio",
    "time": "Not Set",
    "hints": "Focus on your breathing and stroke technique."
  },
  {
    "name": "Yoga Backbend",
    "description": "Improve flexibility and reduce stress with yoga.",
    "icon": Icons.self_improvement,
    "duration": "25 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Keep your core tight and engage your glutes."
  },
  {
    "name": "Wide Legged Bend",
    "description": "Enhance flexibility and relieve tension in your back.",
    "icon": Icons.self_improvement,
    "duration": "30 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Spread your toes and firmly plant them into the mat."
  },
  {
    "name": "Bent Over Twist",
    "description": "A yoga pose to improve spinal mobility and flexibility.",
    "icon": Icons.self_improvement,
    "duration": "30 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Keep your feet parallel and twist evenly through your spine."
  },
  {
    "name": "Windmill",
    "description": "A dynamic stretch to improve flexibility in your hamstrings.",
    "icon": Icons.self_improvement,
    "duration": "30 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Keep your arms straight and avoid slouching your back."
  },
  {
    "name": "Quadricep Stretch",
    "description": "A stretch to improve flexibility in your quadriceps.",
    "icon": Icons.self_improvement,
    "duration": "40 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Keep your knees together and push your hips forward."
  },
  {
    "name": "Hip Flexor Stretch",
    "description": "Stretch to relieve tightness in the hip flexors.",
    "icon": Icons.self_improvement,
    "duration": "40 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Tuck your tailbone and keep your back straight."
  },
  {
    "name": "Shoulder Opener",
    "description": "A stretch to improve shoulder flexibility and posture.",
    "icon": Icons.self_improvement,
    "duration": "30 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Melt your chest towards the mat while keeping your back straight."
  },
  {
    "name": "Butterfly Stretch",
    "description": "A stretch to open up the hips and inner thighs.",
    "icon": Icons.self_improvement,
    "duration": "30 sec",
    "category": "Stretching, Yoga",
    "time": "Not Set",
    "hints": "Fold forward through the hips to deepen the stretch."
  },
  {
    "name": "Push Ups",
    "description": "Strengthen your chest, shoulders, and triceps.",
    "icon": Icons.fitness_center,
    "duration": "1 min / 10 reps per 2 sets",
    "category": "Strength",
    "time": "Not Set",
    "hints": "Keep your body straight and lower yourself until your chest nearly touches the ground."
  },
  {
    "name": "Sit Ups",
    "description": "Focus on strengthening your abdominal muscles.",
    "icon": Icons.fitness_center,
    "duration": "3 min / 10 repetitions per 3 sets",
    "category": "Strength",
    "time": "Not Set",
    "hints": "Lie on your back and curl your upper body towards your knees."
  },
  {
    "name": "Pulse Rows",
    "description": "A strength exercise targeting the back and arms.",
    "icon": Icons.fitness_center,
    "duration": "1 min / 15 repetitions per 3 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Keep your back straight and pull your elbows back."
  },
  {
    "name": "Seal Push-ups",
    "description": "A variation of push-ups that targets the chest and triceps.",
    "icon": Icons.fitness_center,
    "duration": "2 min / 15 repetitions per 3 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Keep your elbows close to your body as you lower yourself."
  },
  {
    "name": "Air Row",
    "description": "An exercise to strengthen the back and improve posture.",
    "icon": Icons.fitness_center,
    "duration": "2 min / 20 repetitions per 2 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Engage your core and pull your elbows back as if rowing."
  },
  {
    "name": "Scapular Planks",
    "description": "A core exercise to enhance stability and strength.",
    "icon": Icons.fitness_center,
    "duration": "30 sec per 2 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Keep your body in a straight line and engage your core."
  },
  {
    "name": "Push-Up & Rotation",
    "description": "A dynamic exercise that combines push-ups with a rotational movement.",
    "icon": Icons.fitness_center,
    "duration": "1 min / 10 repetitions per 2 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Rotate your body to one side after each push-up."
  },
  {
    "name": "Mountain Walkers",
    "description": "A core exercise that mimics a mountain climbing motion.",
    "icon": Icons.fitness_center,
    "duration": "1 min / 20 repetitions per 2 sets",
    "category": "Strength",
    "time": "30 sec",
    "hints": "Keep your core tight and alternate bringing your knees towards your chest quickly."
  }
  ];

  

  // Method to group workouts by category
  Map<String, List<Map<String, dynamic>>> _groupWorkoutsByCategory() {
    Map<String, List<Map<String, dynamic>>> groupedWorkouts = {};
    for (var workout in workouts) {
      final category = workout["category"];
      if (!groupedWorkouts.containsKey(category)) {
        groupedWorkouts[category] = [];
      }
      groupedWorkouts[category]!.add(workout);
    }
    return groupedWorkouts;
  }

  // Method to get image for each category
  String _getCategoryImage(String category) {
    switch (category) {
      case "Cardio":
        return "assets/images/Jogging.jpg";
      case "Stretching, Yoga":
        return "assets/images/Yoga.png";
      case "Flexibility":
        return "assets/images/flexibility.jpg";
      case "Strength":
        return "assets/images/upper-body.jpg";
      default:
        return "assets/images/default.jpg";
    }
  }

// Method to get category descriptions
String _getCategoryDescription(String category) {
  switch (category) {
    case "Cardio":
      return "Cardiovascular exercises to improve heart health and stamina.";
    case "Full Body":
      return "Exercises that involve the entire body, enhancing strength and coordination.";
    case "Flexibility":
      return "Exercises to improve flexibility, range of motion, and muscle relaxation.";
    case "Strength":
      return "Exercises to strengthen muscles and build overall body strength.";
    default:
      return "Exercise category aimed at improving physical and mental health.";
  }
}

  @override
  Widget build(BuildContext context) {
    final categorizedWorkouts = _groupWorkoutsByCategory();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Workouts",
          style: GoogleFonts.poppins(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: categorizedWorkouts.keys.map((category) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Gambar kategori
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          _getCategoryImage(category),
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ExpansionTile untuk kategori
                      ExpansionTile(
                        title: Text(
                          category,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          _getCategoryDescription(category),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        ),
                        iconColor: const Color.fromARGB(255, 192, 77, 0),
                        collapsedIconColor: Colors.orange,
                        children: categorizedWorkouts[category]!
                            .map((workout) => WorkoutCard(
                                  name: workout["name"],
                                  description: workout["description"],
                                  icon: workout["icon"],
                                  duration: workout["duration"],
                                  Hints: workout["hints"],
                                  
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  final String duration;
  final String Hints;

  const WorkoutCard({
    required this.name,
    required this.description,
    required this.icon,
    required this.duration,
    required this.Hints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.orange,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 54, 54, 54)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "$duration",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    // Teks untuk waktu istirahat
                    Text(
                      "Rest when you need it, don't push yourself too hard", // Menambahkan waktu istirahat di bawah durasi
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Hints:",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      Hints,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
