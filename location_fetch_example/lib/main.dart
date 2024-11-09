import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

// add location permission in AndroidManifest.xml file
// flutter pub add geolocator
// flutter pub add geocoding --> for converting location Human Readable Format into Latitute and Longitude

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? position;
  String? address;

  GoogleMapController? _controller;
  Set<Marker> markers = {};

  Future<bool> handlePermission() async {
    bool gps = await Geolocator.isLocationServiceEnabled();
    if (!gps) {
      log('gps is disabled, please enable the location!');
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("permission is denied. Cannot access location"),
          duration: Duration(milliseconds: 3000),
        ));

        return false;
      } else if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enable location permission in settings."),
          duration: Duration(milliseconds: 3000),
        ));

        return false;
      }
    }
    return true;
  }

  getCurrentLocation() async {
    bool permission = await handlePermission();
    if (permission) {
      try {
        final position = await Geolocator.getCurrentPosition();
        setState(() {
          position = position;
        });
        await getAddress(position!);
        moveToPosition(position!);
        addMarker(LatLng(position!.latitude, position!.longitude));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
          duration: const Duration(milliseconds: 3000),
        ));
      }
    }
  }

  getAddress(Position position) async {
    List<Placemark> places =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = places[0];
    setState(() {
      address =
          "${place.name}, ${place.street}, ${place.locality}, ${place.country}";
    });
  }

  void moveToPosition(Position position) {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14)));
  }

  addMarker(LatLng position) {
    Marker marker = Marker(
      markerId: MarkerId('${position.latitude}'),
      position: position,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: const InfoWindow(title: 'My Position'),
    );
    markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            children: [
              Text(address ?? "no address found"),
              ElevatedButton(
                  onPressed: getCurrentLocation,
                  child: const Text("Get Current Location")),
              SizedBox(
                  height: 300,
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      _controller = controller;
                    },
                    mapType: MapType.normal,
                    markers: markers,
                    onTap: (latlong) {
                      addMarker(latlong);
                      setState(() {});
                    },
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(24.4, 68.9), zoom: 14),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  )),
            ],
          ),
        ));
  }
}
