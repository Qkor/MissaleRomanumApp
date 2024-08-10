import 'dart:convert';
import 'package:http/http.dart';
import 'package:missale/models/liturgical_calendar.dart';
import 'package:missale/models/ordo.dart';
import 'package:missale/managers/database_manager.dart';

class MissalApiService{
  String apiUrl = 'https://missalemeum.com/pl/api/v5';
  final DatabaseManager databaseManager;
  MissalApiService(this.databaseManager);

  Future<String> _getRubrics(String rubricsId) async {
    String? json = await databaseManager.getRubrics(rubricsId);
    if(json == null){
      final response = await get(Uri.parse('$apiUrl/$rubricsId'));
      if(response.statusCode == 200){
        json = response.body;
        databaseManager.saveRubrics(rubricsId, json);
      } else {
        throw Exception();
      }
    }
    return json;
  }

  Future<List<LiturgicalCalendar>> fetchCalendar(int year) async {
    String json = await _getRubrics('calendar/$year');
    return (jsonDecode(json) as List)
        .map(((data) => LiturgicalCalendar.fromJson(data)))
        .toList();
  }

  Future<Ordo> fetchOrdo() async {
    String json = await _getRubrics('ordo');
    return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
  }

  Future<Ordo> fetchProper(String id) async {
    String json = await _getRubrics('proper/$id');
    return Ordo.fromJson((jsonDecode(json) as List)[0] as Map<String,dynamic>);
  }
}