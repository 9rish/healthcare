import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static final UserDatabase _instance = UserDatabase._internal();
  factory UserDatabase() => _instance;

  static Database? _database;

  UserDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            email TEXT,
            phone TEXT,
            weight TEXT,
            height TEXT,
            diet TEXT,
            allergies TEXT,
            sleepTime TEXT,
            physicalActivity TEXT,
            sugar TEXT,
            bp TEXT,
            vitaminDeficiencies TEXT,
            medicine TEXT,
            medicineTiming TEXT,
            reminder TEXT,
            waterIntake TEXT,
            arthritis TEXT,
            breathingProblems TEXT
          )
        ''');
      },
    );
  }

  // Add methods to insert, retrieve, and update user data
}
