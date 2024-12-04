import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Profile {
  final String name;
  final String gender;
  final double height;
  final double weight;
  final DateTime birthday;

  

  Profile({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.birthday,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'height': height,
      'weight': weight,
      'birthday': birthday.toIso8601String(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'],
      gender: map['gender'],
      height: map['height'],
      weight: map['weight'],
      birthday: DateTime.parse(map['birthday']),
    );
  }
}

class DatabaseInfo {
  static final DatabaseInfo _instance = DatabaseInfo._internal();
  factory DatabaseInfo() => _instance;
  DatabaseInfo._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profile.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE profile (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            gender TEXT,
            height REAL,
            weight REAL,
            birthday TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveProfile(Profile profile) async {
  try {
    final db = await database;
    await db.delete('profile'); // Delete old data if only one profile is allowed
    await db.insert('profile', profile.toMap());
  } catch (e) {
    // Handle error, e.g., log it or show a message to the user
    print("Error saving profile: $e");
  }
}

  Future<Profile?> getProfile() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('profile', limit: 1);

    if (maps.isNotEmpty) {
      return Profile.fromMap(maps.first);
    }
    return null;
  }

  /// Reset the database by clearing all data in the profile table
  Future<void> resetDatabase() async {
    final db = await database;
    await db.delete('profile'); // Hapus semua data dari tabel
  }
}