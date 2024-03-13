import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:missale/widgets/map_marker.dart';

class MapPage extends StatelessWidget{

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
        const MarkerLayer(
          markers: [
            Marker(
              point: LatLng(52.393413248614884, 16.920842572176696),
              child: CustomMapMarker(description: "Rynek Wildecki 4, Parafia Maryi Królowej.", type: 'indult'),
            ),
            Marker(
              point: LatLng(52.40910965801039, 16.935100044363203),
              child: CustomMapMarker(description: "ul. Żydowska 34, Sanktuarium Najświętszej Krwi Pana Jezusa", type: 'indult'),
            ),
            Marker(
              point: LatLng(52.413534119780785, 16.90321854578913),
              child: CustomMapMarker(description: "ul. Kościelna 3, Parafia p.w. Najświętszego Serca Jezusa i Świętego Floriana ", type: 'indult'),
            ),
            Marker(
              point: LatLng(52.4004046835821, 16.859684581345576),
              child: CustomMapMarker(description: "ul. Ptasia 14A, kaplica FSSPX", type: 'fsspx'),
            ),
          ],
        )
      ],
    );
  }
}