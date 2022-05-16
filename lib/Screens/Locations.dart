import 'package:flutter/material.dart';
import 'package:search_map_location/utils/google_search/latlng.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/widget/search_widget.dart';

class LocationPage extends StatefulWidget {

  LocationPage({Key? key, this.callBack}):super(key:key);

  var callBack;

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<LocationPage> {

  var location;

  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(child:Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: [


              Container(

                padding: EdgeInsets.all(30),

                child: Text("Select Your Location"),

              ),

              Positioned(

                  child:Center(child:SearchLocation(
                  language: 'en',
                  location: LatLng(latitude: 9.173719,  longitude: 12.415134),
                  radius: 1100,
                  country: 'NG',
                  apiKey: "AIzaSyCiet_FcKQLiHioow4uunEJ8TrtWS8wUsc", // YOUR GOOGLE MAPS API KEY
                  onSelected: (Place place) async{

                    final geolocation = await place.geolocation;
                    setState((){



                      location = place.description;


                    });


                    var pl = await geolocation!.coordinates;



                    },

                ))),


              Container(

                padding: EdgeInsets.all(30),

                child: Text("Enter Address"),

              ),

              Padding(

                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                  child:Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0,
                          blurRadius: 10
                        )
                      ]
                    ),
                      padding: EdgeInsets.all(20),
                      child:
                      TextField(
                        controller: address,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Enter your address, house or street number"
                        ),

                      )
                  )),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: FlatButton(
                    color: Colors.deepOrange,
                    onPressed: (){

                      widget.callBack(location, address.text.toString());

                      Navigator.of(context).pop();

                    },
                    child: Text("Set Delivery Address", style: TextStyle(color: Colors.white),),
                  )),




            ],
          )
    )
    ));
  }
}
