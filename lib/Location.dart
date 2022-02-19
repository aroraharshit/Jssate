import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/constants.dart';

class Location extends StatefulWidget {
  static const String id = 'Location';
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.6141, 77.3588);

  MapType _currentMapType = MapType.normal;

  final Set<Marker> _markers={};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget button(VoidCallback function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: kColor,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  _onAddMarkedButtonPressed(){
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_center.toString()),
          position:_center,
          infoWindow: InfoWindow(
            title: 'This is a title',
            snippet: 'this is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('JSSATE Location'),
          backgroundColor: kColor,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              onMapCreated: _onMapCreated,
              mapType: _currentMapType,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    button(() {_onMapTypeButtonPressed();}, Icons.map),
                    SizedBox(height: 16.0,),
                    button(() { _onAddMarkedButtonPressed();},Icons.add_location)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
