import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager{
  Database? _database;

  initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'missale.db');
    _database = await openDatabase(
        path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE rubrics (id TEXT PRIMARY KEY, json TEXT)');
        }
    );
  }

  getRubrics(id) async {
    return await _database!.query('rubrics', where: 'id=?', whereArgs: [id]);
  }

  saveRubrics(id, json) async {
    return await _database!.insert('rubrics', {'id' : id, 'json': json}, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}