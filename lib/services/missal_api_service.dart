import 'dart:convert';
import 'package:http/http.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/models/ordo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MissalApiService{

  String apiUrl = 'https://missalemeum.com/pl/api/v5';
  late Database database;

  databaseSetup() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'missale.db');
    database = await openDatabase(
      path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE rubrics (id TEXT PRIMARY KEY, json TEXT)');
      }
    );
  }

  MissalApiService(){
    databaseSetup();
  }

  Future<List<LiturgicalCalendar>> fetchCurrentYearCalendar() async {
    String json = '';
    final queryResult = await database.query('rubrics', where: 'id=?', whereArgs: ['/calendar']);
    if(queryResult.isNotEmpty){
      json = queryResult.first['json'] as String;
    } else {
      final response = await get(Uri.parse('$apiUrl/calendar'));
      if(response.statusCode == 200){
        json = response.body;
        database.insert('rubrics', {'id' : '/calendar', 'json': json}, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    if(json.isNotEmpty){
      return (jsonDecode(json) as List)
          .map(((data) => LiturgicalCalendar.fromJson(data)))
          .toList();
    }
    throw Exception();
  }

  Future<Ordo> fetchOrdo() async {
    String json = '';
    final queryResult = await database.query('rubrics', where: 'id=?', whereArgs: ['/ordo']);
    if(queryResult.isNotEmpty){
      json = queryResult.first['json'] as String;
    } else {
      final response = await get(Uri.parse('$apiUrl/ordo'));
      if(response.statusCode == 200){
        json = response.body;
        database.insert('rubrics', {'id' : '/ordo', 'json': json}, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    if(json.isNotEmpty){
      return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
    }
    throw Exception();
  }

  Future<Ordo> fetchProper(String id) async {
    String json = '';
    final queryResult = await database.query('rubrics', where: 'id=?', whereArgs: ['/proper/$id']);
    if(queryResult.isNotEmpty){
      json = queryResult.first['json'] as String;
    } else {
      final response = await get(Uri.parse('$apiUrl/proper/$id'));
      if(response.statusCode == 200){
        json = response.body;
        database.insert('rubrics', {'id' : '/proper/$id', 'json': json}, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    if(json.isNotEmpty){
      return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
    }
    throw Exception();
  }
}