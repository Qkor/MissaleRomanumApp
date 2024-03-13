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

  Future<String> _getRubrics(String rubricsId) async {
    String json = '';
    final queryResult = await database.query('rubrics', where: 'id=?', whereArgs: [rubricsId]);
    if(queryResult.isNotEmpty){
      json = queryResult.first['json'] as String;
    } else {
      final response = await get(Uri.parse('$apiUrl/$rubricsId'));
      if(response.statusCode == 200){
        json = response.body;
        database.insert('rubrics', {'id' : rubricsId, 'json': json}, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    return json;
  }

  Future<List<LiturgicalCalendar>> fetchCalendar(int year) async {
    String json = await _getRubrics('calendar/$year');
    if(json.isNotEmpty){
      return (jsonDecode(json) as List)
          .map(((data) => LiturgicalCalendar.fromJson(data)))
          .toList();
    }
    throw Exception();
  }

  Future<Ordo> fetchOrdo() async {
    String json = await _getRubrics('ordo');
    if(json.isNotEmpty){
      return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
    }
    throw Exception();
  }

  Future<Ordo> fetchProper(String id) async {
    String json = await _getRubrics('proper/$id');
    if(json.isNotEmpty){
      return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
    }
    throw Exception();
  }
}