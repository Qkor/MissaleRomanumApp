import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import '../models/map_marker.dart';

class MapManager{
  static List<MapMarker> markers = [];

  static loadMapMarkers() async {
    // final String json = await rootBundle.loadString('assets/map_markers.json');
    // if(json.isNotEmpty){
    //   return (jsonDecode(json) as List)
    //     .map(((data) => MapMarker.fromJson(data)))
    //     .toList();
    // }
    // throw Exception();

    final String xml = await rootBundle.loadString('assets/map_markers.kml');
    final document = XmlDocument.parse(xml);
    final placemarks = document.findAllElements('Placemark');
    markers = placemarks.map(((data) => MapMarker.fromXml(data))).toList();
  }
}