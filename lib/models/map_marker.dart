import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:missale/widgets/map_marker_widget.dart';

class MapMarker extends Marker{
  const MapMarker({required super.point, required super.child});
  factory MapMarker.fromJson(Map<String, dynamic> json){
    return MapMarker(
      point: LatLng(json['latitude'], json['longitude']),
      child: CustomMapMarkerWidget(
        name: json['name'],
        address: json['address'],
        type: json['type'],
        link: json['link'],
      )
    );
  }
}