import 'sample_optional.dart'; // Importamos la nueva función
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    try {
      _database = await _initializeDB('Local.db');
    } catch (e) {
      // Manejo de errores al inicializar la base de datos
      // ignore: avoid_print
      print('Error al inicializar la base de datos: ${e.toString()}');
    }
    return _database!;
  }

  // Método privado para inicializar la base de datos.
  Future<Database> _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    // Comprobamos si la base de datos ya existe
    bool dbExists = await databaseExists(path); // Renombramos la variable

    if (!dbExists) {
      // Si no existe, creamos la base de datos y añadimos los datos de ejemplo
      final db = await openDatabase(path, version: 1, onCreate: _createDB);
      // ADD EXAMPLE LIST RANDOM
      await insertSampleData(db);
      return db;
    } else {
      return await openDatabase(path, version: 1, onCreate: _createDB);
    }
  }

  // Método para crear la tabla en la base de datos.
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Localdata(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT NOT NULL,
        Age INTEGER NOT NULL,
        PhoneNumber TEXT NOT NULL
      )
    ''');
  }

  // Agregar datos a la base de datos.
  Future<int> addUser(UserModel user) async {
    // Obtenemos la instancia de la base de datos.
    final db = await database;
    try {
      // Intentamos insertar el nuevo usuario.
      return await db.insert('Localdata', user.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error al añadir datos: ${e.toString()}');
      return -1; // Devolver -1 en caso de error.
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('Localdata', orderBy: 'id DESC');

    try {
      return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
    } catch (e) {
      // En caso de error, se imprime el error y se retorna una lista vacía.
      // ignore: avoid_print
      print('Error al leer datos: ${e.toString()}');
      // Devolver una lista vacía en caso de error.
      return [];
    }
  }

  Future<int> updateUser(UserModel user) async {
    final db = await database;

    try {
      return await db.update('Localdata', user.toMap(),
          where: 'id = ?', whereArgs: [user.id]);
    } catch (e) {
      // En caso de error, se imprime el error y se devuelve -1.
      // ignore: avoid_print
      print('Error al actualizar datos: ${e.toString()}');
      return -1; // Devolver -1 en caso de error.
    }
  }

  Future<void> deleteUser(int id) async {
    // Obtenemos la instancia de la base de datos.
    final db = await database;

    try {
      await db.delete('Localdata', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      // En caso de error, se imprime el error.
      // ignore: avoid_print
      print('Error al eliminar datos: ${e.toString()}');
    }
  }
}
