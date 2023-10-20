import 'dart:convert';
import 'dart:developer';

import 'package:app_riverpod_version/Components/info_dialogue.dart';
import 'package:app_riverpod_version/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

void main() => runApp(MyMap());

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapState();
}

class MyMapState extends State<MyMap> {
  BitmapDescriptor sourceIcon =
      BitmapDescriptor.defaultMarker; //Macht aus Bilder von den Assets Icons
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};
  var data;
  late Set<Marker> markers = new Set();
  late BitmapDescriptor bitmapIcon;

  void getLocation() async {
    var location = await currentLocation
        .getLocation(); // Variable für location wird inititalisiert
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        //Abrufen des standorts vom Handy
        target: LatLng(loc.latitude ?? 0.0,
            loc.longitude ?? 0.0), //LÄngen und Breitengrad vom Handy ziehen
        zoom: 17.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    }); // MARKER HINZUFÜGEN FÜR EIGENE POSITION
  }

  @override
  void initState() {
    getBikesData();
    super.initState();
    setState() {
      getLocation();
    }
  }

// Widget zum Darstellen von Google Maps
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("NextBike"),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(54.3233, 10.1227),
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },

        markers:
            markers, //DAS SIND DIE MARKER DIE DAFÜR SORGEN, DIE ORTE DER NEXTBIKE API AUF DER MAP ZU ZEIGEN
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_searching,
          color: Colors.white,
        ),
        onPressed: () {
          getLocation();
        },
      ),
    );
  }

// Funktion für das Abrufen der Koordinaten der Bikes

  List<Place> places = [];

  void getBikesData() async {
    String cityCode = '613';

    ///this is the city code of Kiel (Germany)
    String dataurl =
        "https://api.nextbike.net/maps/nextbike-live.json?city=${cityCode}";
    var url = Uri.parse(//Die URL wird analysiert sonst spuckt sie Fehler aus
        dataurl);
    var res = await http.get(url);
    if (res != null) {
      setState(() {
        data = json.decode(res.body);

        //Sobald die API Daten wiedergibt werden die in data gespeichert
      });
      places = [];
      dynamic list = data["countries"][0]["cities"][0]
          ["places"]; // So werden die Daten Strukturiert
      //Countries, Cities und Places sind jeweils listen. Für unseren Fall benutzen wir Places.

//Im Models Ordner wird das Model "Place" gespeichert. Dort werden alle Daten von jedem Ort strukturiert, die wir von der API bekommen
      log("MK: data: ${list.length}");
      for (int i = 0; i < list.length; i++) {
        places.add(Place.fromJson(list[i]));
        //Das Model "Place" hat die Methode "fromJson(data)" bekommen."
        //Hier nehmen wir die Daten, die uns die JSON von Place gibt.
        //Diese werden dann als Parameter gegeben. Zugleich werden die Convertiert in das Place Objekt
      }
      addMarkers(places); //Funktion für das Platzieren der Marker
    } else {}
  }

  addMarkers(List<Place> places) async {
    bitmapIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(200, 200)),
        'assets/mapsymbol/bike_marker.png');
    log("MK bitmapIcon: ${bitmapIcon}");

    //Für den Custom Map Marker haben wir den BitmapDescriptor benutzt.
    //Dieser generiert Icons von den Assets

    final Set<Marker> markers = new Set(); //Liste der Marker wird initialisiert
    places.forEach((element) {
      //Für Jeden ort wird ein Marker platziert

      markers.add(Marker(
        //Platzierung des ersten Markers
        markerId: MarkerId(element.uid.toString()),
        position: LatLng(element.lat!, element.lng!),
        //Position des Markers
        infoWindow: InfoWindow(
          //Das PopUp Fenster sobald das TextFeld gedrückt wird
          title: '${element.name ?? ''}',
          snippet:
              '${element.bikesAvailableToRent ?? 0}  Verfügbar von ${element.bikes ?? 0}',
          onTap: () {
            //Diese onTap Funktion mit createAlertDialogue wird abgerufen sobald der nutzer raufdrückt
            createAlertDialogue(
                element); //mit element werden mehrere Details wiedergegeben
          },
        ),
        icon: bitmapIcon ?? BitmapDescriptor.defaultMarker,

        ///Das bitMapicon wird erstellt mit dem BitmapDescriptor
      ));
    });
    setState(() {
      this.markers = markers; //Sorgt für updates in der UI
    });
  }

  createAlertDialogue(Place element) {
    return showAlertDialog(context, widgets: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Details",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bereich: ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "${element.name}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Addresse: ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "${element.address ?? 'N/A'}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        "Bikes:",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Gesamt:  ${element.bikes}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Gebucht:  ${element.bookedBikes}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Verfügbar:  ${element.bikesAvailableToRent}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        "Bike Typen:",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "i71:   ${element.bikeTypes!.i71 ?? 0} bikes",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "i150:   ${element.bikeTypes!.i150 ?? 0} bikes",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        "Mehr Details:",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ID:   ${element.uid ?? ''}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Terminal Type:   ${(element.terminalType ?? '').toUpperCase()}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Wartung:   ${(element.maintenance.toString() ?? '').toUpperCase()}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Place Type:   ${element.placeType ?? ''}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}
