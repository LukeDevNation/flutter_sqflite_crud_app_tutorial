import 'sample_optional.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

class DatabaseService {
  static Database? _database; // Singleton database instance

  // Lazy initialization of the database
  Future<Database> get database async {
    // If the database is already initialized, return it
    if (_database != null) return _database!;
    try {
      _database = await _initializeDB('Local.db'); // Otherwise, initialize it
    } catch (e) {
      // Error handling if database initialization fails
      // ignore: avoid_print
      print('Error initializing database: ${e.toString()}');
    }
    return _database!; // Return the initialized database instance
  }

  // Private method to initialize the database
  Future<Database> _initializeDB(String filepath) async {
    // Get the path to the database directory
    final dbpath = await getDatabasesPath();
    // Create the full path for the database file
    final path = join(dbpath, filepath);

    // Check if the database already exists
    bool dbExists = await databaseExists(path);

    if (!dbExists) {
      // If it doesn't exist, open the database, create it and add sample data
      final db = await openDatabase(path, version: 1, onCreate: _createDB);
      await insertSampleData(db); // Insert sample data if the database is new
      return db;
    } else {
      // If the database exists, just open it
      return await openDatabase(path, version: 1, onCreate: _createDB);
    }
  }

  // Method to create the database table
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Localdata(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT NOT NULL,
        Age INTEGER NOT NULL,
        PhoneNumber TEXT NOT NULL
      )
    '''); // SQL command to create the "Localdata" table
  }

  // Method to add a new user to the database
  Future<int> addUser(UserModel user) async {
    final db = await database; // Get the database instance
    try {
      // Insert the user data into the "Localdata" table
      return await db.insert('Localdata', user.toMap());
    } catch (e) {
      // Error handling for database insertion
      // ignore: avoid_print
      print('Error adding data: ${e.toString()}');
      return -1; // Return -1 to indicate failure
    }
  }

  // Method to fetch all users from the database
  Future<List<UserModel>> getAllUsers() async {
    final db = await database; // Get the database instance
    final List<Map<String, dynamic>> maps = await db.query('Localdata',
        orderBy: 'id DESC'); // Fetch all users, ordered by id

    try {
      // Convert the result set into a list of UserModel objects
      return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
    } catch (e) {
      // Error handling for data fetching
      // ignore: avoid_print
      print('Error reading data: ${e.toString()}');
      return []; // Return an empty list in case of error
    }
  }

  // Method to update an existing user's data
  Future<int> updateUser(UserModel user) async {
    final db = await database; // Get the database instance

    try {
      // Update the user data in the database
      return await db.update('Localdata', user.toMap(),
          where: 'id = ?', whereArgs: [user.id]);
    } catch (e) {
      // Error handling for data update
      // ignore: avoid_print
      print('Error updating data: ${e.toString()}');
      return -1; // Return -1 to indicate failure
    }
  }

  // Method to delete a user from the database
  Future<void> deleteUser(int id) async {
    final db = await database; // Get the database instance

    try {
      // Delete the user from the "Localdata" table
      await db.delete('Localdata', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      // Error handling for data deletion
      // ignore: avoid_print
      print('Error deleting data: ${e.toString()}');
    }
  }
}
