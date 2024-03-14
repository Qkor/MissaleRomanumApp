import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:missale/models/map_marker.dart';

class MapPage extends StatelessWidget{

  final List<MapMarker> markers;
  const MapPage({super.key, required this.markers});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(52.4, 16.9),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.qkor.missale',
        ),
        MarkerLayer(
          markers: markers,
        )
      ],
    );
  }
}