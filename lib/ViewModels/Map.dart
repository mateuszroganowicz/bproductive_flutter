import 'dart:async';
import 'dart:collection';

import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:bproductiveflutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'AddTaskDialog.dart';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  Set<Marker> markers = HashSet<Marker>();

  Completer<GoogleMapController> mapController = Completer();
  static const center = const LatLng(37.77483, -122.41942);
  LatLng lastPosition = center;
  MapType currentMapType = MapType.normal;

  void onMapCreated(GoogleMapController controller)
  {
    mapController.complete(controller);

    setState(() {
      markers.add(Marker(
        markerId: MarkerId('0'),
        position: center,
        infoWindow: InfoWindow(title: 'San Francisco', snippet: 'A city lol'),
      ));
    });
  }

  void onCameraMove(CameraPosition position)
  {
      lastPosition = position.target;
  }

  void addMarkerOnLocation()
  {
    setState(() {
      markers.add(Marker(
          markerId: MarkerId(lastPosition.toString()),
          position: lastPosition,
        infoWindow: InfoWindow(title: 'Sample Task', snippet: 'Priority : test'),
        icon: BitmapDescriptor.defaultMarker,
      ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 12,
            ),
            markers: markers,
            mapType: currentMapType,
            onCameraMove: onCameraMove,
            //myLocationButtonEnabled: true,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50),
            child: Text(
                'Navigate to a location to add the task',
                style: TextStyle(color: MyApp.accent_color),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addMarkerOnLocation();
          showDialog(context: context, builder:
              (BuildContext context){
            return AddTaskDialog();
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
