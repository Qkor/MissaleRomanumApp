import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(52.4, 16.93),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.qkor.missale',
        ),
        const MarkerLayer(
          markers: [
            Marker(
              point: LatLng(52.393413248614884, 16.920842572176696),
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: Colors.blue),
            ),
            Marker(
              point: LatLng(52.40910965801039, 16.935100044363203),
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: Colors.blue),
            ),
            Marker(
              point: LatLng(52.413534119780785, 16.90321854578913),
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: Colors.blue),
            ),
            Marker(
              point: LatLng(52.4004046835821, 16.859684581345576),
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: Colors.redAccent),
            ),
          ],
        )
      ],
    );
  }
}