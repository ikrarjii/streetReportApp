import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street__report/page/tambahLaporan.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TambahLaporan(),
              ));
        },
        child: FlutterMap(
          options: const MapOptions(
              initialCenter: LatLng(1.2878, 103.8666),
              initialZoom: 11,
              interactionOptions:
                  InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
          children: [
            openStreetMapTileLayer,
          ],
        ),
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      );
}
