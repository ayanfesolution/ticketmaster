import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenMapScreen extends StatelessWidget {
  const OpenMapScreen({super.key, required this.long, required this.lat});
  final double long;
  final double lat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('OpenStreetMap Location')),
      body: FlutterMap(
        options: MapOptions(
          initialZoom: 15.0,
          initialCenter: LatLng(lat, long), // Latitude, Longitude
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(33.445899, -112.071313),
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
