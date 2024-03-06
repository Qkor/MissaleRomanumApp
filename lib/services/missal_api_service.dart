import 'dart:convert';

import 'package:http/http.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/models/ordo.dart';

class MissalApiService{

  String apiUrl = 'https://missalemeum.com/pl/api/v5';

  Future<List<LiturgicalCalendar>> fetchCurrentYearCalendar() async {
    final response = await get(Uri.parse('$apiUrl/calendar'));
    if(response.statusCode == 200){
      return (jsonDecode(response.body) as List)
          .map(((data) => LiturgicalCalendar.fromJson(data)))
          .toList();
    }
    throw Exception();
  }

  Future<Ordo> fetchOrdo() async {
    final response = await get(Uri.parse('$apiUrl/ordo'));
    if(response.statusCode == 200){
      return Ordo.fromJson((jsonDecode(response.body) as List)[0] as Map<String,dynamic>);
    }
    throw Exception();
  }

}