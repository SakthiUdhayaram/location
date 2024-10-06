import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  final String location;

  MapScreen({required this.location});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? _locationCoordinates;

  @override
  void initState() {
    super.initState();
    _getCoordinates();
  }

  Future<void> _getCoordinates() async {
    try {
      List<Location> locations = await locationFromAddress(widget.location);
      if (locations.isNotEmpty) {
        setState(() {
          _locationCoordinates = LatLng(locations.first.latitude, locations.first.longitude);
        });
      } else {
        _showError('Location not found.');
      }
    } catch (e) {
      _showError('Invalid location: ${widget.location}');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: _locationCoordinates == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          // Move the camera to the location if it's known
          if (_locationCoordinates != null) {
            controller.animateCamera(CameraUpdate.newLatLng(_locationCoordinates!));
          }
        },
        initialCameraPosition: CameraPosition(
          target: _locationCoordinates ?? LatLng(0, 0), // Default to 0,0 if not set
          zoom: 14.0,
        ),
        markers: {
          if (_locationCoordinates != null)
            Marker(
              markerId: MarkerId('location'),
              position: _locationCoordinates!,
            ),
        },
      ),
    ));
  }
}
