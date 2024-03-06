import 'dart:convert';

import 'package:http/http.dart';
import 'package:missale/models/calendar.dart';

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

}