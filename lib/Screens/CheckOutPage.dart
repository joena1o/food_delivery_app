import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:fooddeliveryapp/Api/CheckOutClass.dart';
import 'package:fooddeliveryapp/Screens/Locations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fooddeliveryapp/Screens/Widgets/ImageCom.dart';
import 'package:flutter_config/flutter_config.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key? key, this.price, this.cart, this.order, required this.qty})
      : super(key: key);

  var price;
  var cart, order;

  var qty;


  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {



  CheckOutClass chck = CheckOutClass();

  var location = "Not Specified";
  var address = "Not Specified";



  var lat, lng;


  var coordinates = "Not Specified";

  setLocation(_location, _address) {
    setState(() {
      location = _location;
      address = _address;
    });
  }

  void initState() {
    super.initState();

    plugin.initialize(publicKey: publicKey);
  }


  //PayStack Integration

  var publicKey = FlutterConfig.get("PUBLIC_KEY");
  final plugin = PaystackPlugin();



  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard(price) async {
    var charge = Charge()
      ..amount = price *
          100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = "mamakuchalirestaurant@gmail.com";

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      _showMessage('Payment was successful!!!');
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }


  //PayStack Integration

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ("Check-Out"),
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.deepOrange,
        elevation: 0,

        toolbarHeight: 70,
        leading: Container(),
        leadingWidth: 20,

        actions: [

                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: (){

                      Navigator.of(context).pop();

                    },
                    icon: Icon(Icons.close, size: 30,),
                  ),
                )

        ],
//        leading: IconButton(
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//          icon: Icon(
//            Icons.keyboard_backspace,
//            size: 26,
//          ),
//        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView.builder(
          itemCount: widget.cart.length + 1,
          itemBuilder: (BuildContext ctx, i) {
            if (i == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        "Customer Details",
                        style: TextStyle(
                            fontSize: 16,
//                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Name: Hyefur Jonathan",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Email: jonathanhyefur@gmail.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Phone: 23489056513",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: FlatButton(
                                color: Colors.deepOrange,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (_) => ModalBottom(context));
                                },
                                child: Text(
                                  "Edit User Details",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        "Delivery Address",
                        style: TextStyle(
                            fontSize: 16,
//                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Location: ${location}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Address: ${address}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Coordinates: ${coordinates}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: FlatButton(
                                color: Colors.deepOrange,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (_) => ModalBottom(context));
                                },
                                child: Text(
                                  "Edit Delivery Address",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        "Your Order",
                        style: TextStyle(
                            fontSize: 16,
//                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width * .3,
                        height: size.width * .3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                ImageCom(image: widget.cart[i - 1]['image']))),
                    Container(
                      width: size.width * .5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.cart[i - 1]['item_name']}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text('Quantity: ${widget.cart[i - 1]['quantity']}'),
                          Container(
                            height: 10,
                          ),
                          Text('Price: N${widget.cart[i - 1]['item_price']}')
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: N${widget.price} + 500",
                style: TextStyle(fontSize: 16),
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {


                  if(location == "Not Specified"){

                    _showMessage("Please Edit Delivery Address");

                    return;

                  }

                  try{

                    chargeCard((widget.price+500).round());

                  }catch(e){
                    print(e.toString());
                  }




//                  chck.checkOut(widget.order, "jonathanhyefur@gmail.com", widget.price, "08021388758", widget.qty, location, address, lat, lng).
//                  then((value){
//
//                    if(value=="Successful")
//                      Navigator.of(context).pop();
//
//                  });

                },
                child: Text("Pay now", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ModalBottom(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.3,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {


                  showDialog(
                    context:context,
                    builder: (_)=>Center(
                      child: CircularProgressIndicator(),
                    )
                  );


                 _determinePosition().then((value) async{

                   List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude, value.longitude);

                   print(placemarks[0].locality);

                   setState((){

                     location = placemarks[0].locality.toString();

                     address = placemarks[0].street.toString();

                     lat = value.latitude;

                     lng = value.longitude;

                     coordinates = value.toString();

                   });

                   print(placemarks[0].street);

                   Navigator.of(context).pop();

                 });

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.location_on),
                      ),
                      Container(
                        width: 20,
                      ),
                      Text("Current Location")
                    ],
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => LocationPage(
                            callBack: setLocation,
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.map),
                      ),
                      Container(
                        width: 20,
                      ),
                      Text("Set From Map")
                    ],
                  ),
                ))
          ],
        ));
  }



}
