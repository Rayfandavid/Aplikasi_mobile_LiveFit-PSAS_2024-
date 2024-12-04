class WorkoutPlan {
  final int id;
  final String name;
  final String description;
  final List<Workout> workouts;

  WorkoutPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.workouts,
  });
}

class Workout {
  final String day;
  final String exercise;
  final int sets;
  final int reps;

  Workout({
    required this.day,
    required this.exercise,
    required this.sets,
    required this.reps,
  });
}
