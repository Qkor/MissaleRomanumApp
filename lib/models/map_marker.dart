import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:missale/widgets/map_marker_widget.dart';
import 'package:xml/xml.dart';

class MapMarker extends Marker{
  const MapMarker({required super.point, required super.child});
  factory MapMarker.fromJson(Map<String, dynamic> json){
    return MapMarker(
      point: LatLng(json['latitude'], json['longitude']),
      child: CustomMapMarkerWidget(
        name: json['name'],
        address: json['address'],
        link: json['link'],
      )
    );
  }
  factory MapMarker.fromXml(XmlElement xml){
    final name = xml.findAllElements('name').first.innerText;
    final address = xml
        .findAllElements('Data')
        .where((element) => element.getAttribute('name') == 'Lokalizacja')
        .first.findElements('value').first.innerText;
    final website = xml
        .findAllElements('Data')
        .where((element) => element.getAttribute('name') == 'www')
        .first.findElements('value').first.innerText;
    final coordinates = xml.findAllElements('coordinates').first.innerText.trim();
    final longitude = double.parse(coordinates.split(',')[0]);
    final latitude = double.parse(coordinates.split(',')[1]);
    return MapMarker(
        point: LatLng(latitude, longitude),
        child: CustomMapMarkerWidget(
          name: name,
          address: address,
          link: website,
        )
    );
  }
}