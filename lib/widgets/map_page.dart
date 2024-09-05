import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:missale/managers/map_manager.dart';
import 'package:missale/widgets/custom_app_bar.dart';

class MapPage extends StatelessWidget{
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: const CustomAppBar(title: "Msze Święte"),
        body: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(52.4, 16.9),
            initialZoom: 9.2,
            interactionOptions: InteractionOptions(flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag)
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.qkor.missale',
            ),
            MarkerLayer(
              markers: MapManager.markers,
            )
          ],
        )
      );
  }
}