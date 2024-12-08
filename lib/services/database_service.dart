import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Database? _database;

  DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return db.insert('users', user.toMap());
  }

  Future<UserModel?> getUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('users');
    return result.map((user) => UserModel.fromMap(user)).toList();
  }
}
