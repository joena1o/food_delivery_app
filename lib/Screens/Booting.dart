import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BootingScreen extends StatefulWidget {
  @override
  _BootingScreenState createState() => _BootingScreenState();
}

class _BootingScreenState extends State<BootingScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child:

      Scaffold(

      body:Container(

      width: size.width,
      height: size.height,
      color: Colors.orange,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Container(
            padding: EdgeInsets.all(30),
            child: Text("BigBite Restaurant", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),),
          ),

          Container(
            padding: EdgeInsets.all(30),
            child: Lottie.asset('assets/8980-order-status-for-food-delivery.json'),
          )

        ],
      ),

    )));
  }
}
