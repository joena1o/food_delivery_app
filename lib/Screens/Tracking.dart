import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_config/flutter_config.dart';

class LocationTrack extends StatefulWidget {
  @override
  _LocationTrackState createState() => _LocationTrackState();
}

class _LocationTrackState extends State<LocationTrack> {

  bool zoomDriver = true;
  bool loaded = false;


  var apikey = FlutterConfig.get("API_KEY");

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylinecoordinates = [];

   PolylinePoints polylinePoints = PolylinePoints();

   var latV, lngV;


  @override
  void initState(){
    super.initState();



    _determinePosition().then((value){

      setState(() {

        latV = value.latitude;
        lngV = value.longitude;

        _kLake = CameraPosition(
          bearing: 192.8334901395799,
          tilt: 69.440717697143555,
          target: LatLng(value.latitude, value.longitude),
          zoom: 15.4746,
        );

        origin = Marker(
            markerId: const MarkerId('You'),
            infoWindow: const InfoWindow(title: 'You'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: LatLng(value.latitude, value.longitude),
        );


        loaded = !loaded;

      });


      setPolyLines();



    });



  }

  Completer<GoogleMapController> _controller = Completer();

    CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.23000, 12.460000),
      bearing: 192.8334901395799,
      tilt: 69.440717697143555,
    zoom: 14.4746,
  );

    CameraPosition _kLake = CameraPosition(
     // bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);

   late Marker origin;

  Marker dest = Marker(
      markerId: const MarkerId('Driver'),
      infoWindow: const InfoWindow(title: 'Driver'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: LatLng(9.23000, 12.460000),
  );



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(child:Scaffold(

      body: Container(

        width: size.width,
        height: size.height,

             child: Stack(
                children: [



                 Positioned(child:(loaded)?GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    polylines: _polylines,
                    markers: {
                  origin, dest
                  },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                    },
                  ):Center(child:CircularProgressIndicator())),

                 Positioned(
                     top:5,
                     child: Container(
                       width: size.width-20,
                       margin: EdgeInsets.all(10),
                       padding: EdgeInsets.all(20),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black12,
                             blurRadius: 3,
                             spreadRadius: 1
                           )
                         ]
                       ),

                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text("Delivery To"),
                               Container(height: 10,),
                               Text("Hyefur Jonathan", style: TextStyle(fontSize: 13, color: Colors.grey))

                             ],
                           )

                           ,
                           Icon(Icons.location_on, color: Colors.blueAccent, size: 35,)



                         ],
                       ),
                     )

                 ),

                 Positioned(
                     bottom:0,

                     child: Container(
                       width: size.width,

                       padding: EdgeInsets.all(20),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                         color: Colors.white,
                       ),

                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text("Driver"),
                               Container(height: 10,),
                               Text("Suleiman Sanni", style: TextStyle(color: Colors.grey),),
                               Container(height: 10,),
//                               Text("23 mins away", style: TextStyle(fontSize: 17)),
                               Container(height: 10,),
//                               Text("12km away", style: TextStyle(fontSize: 17)),
                               Container(height: 10,),
                               Text("From: BigBite Restaurant"),
                               Container(height: 10,),
                               Text("To: You"),
                               Container(height: 50,),


                             ],
                           )

                           ,
                           Icon(Icons.location_on, color: Colors.orangeAccent, size: 40,)



                         ],
                       ),
                     )

                 ),

                ],
              )




            ),
        floatingActionButton: FloatingActionButton(
          onPressed: _goToTheLake,
          backgroundColor: Colors.orange,
          //label: Text('To the lake!'),
          child: Icon(Icons.location_searching),
        ),







    ));

  }

  Future<void> _goToTheLake() async {

    if(zoomDriver){
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex,));

      setState(() {

        zoomDriver = !zoomDriver;

      });

    }else{
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

      setState(() {

        zoomDriver = !zoomDriver;

      });
    }

  }

  setPolyLines()async {

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apikey,

        PointLatLng(latV, lngV),

        PointLatLng(9.23000, 12.460000),

    );

    print("result= ${result.points}");

    if(result.status == "OK"){

        result.points.forEach((PointLatLng point) {


          setState((){

            polylinecoordinates.add(
                LatLng(point.latitude, point.longitude)
            );


          });



        });
        
        setState((){
          
          _polylines.add(
            Polyline(
              width: 3,
              polylineId: PolylineId("polyline"),
              color: Colors.red,
              points: polylinecoordinates
            )
          );
          
        });

    }


  }

}
