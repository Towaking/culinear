import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapsPage({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('selected-location'),
            position: LatLng(latitude, longitude),
          ),
        },
      ),
    );
  }
}
