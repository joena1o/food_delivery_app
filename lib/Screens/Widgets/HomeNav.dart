import 'package:flutter/material.dart';

import 'ImageCom.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height*0.11,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            spreadRadius: 4
          )
        ]

      ),

      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Hello, Hyefur Jonathan", style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.orangeAccent),),
                Text("What would you like today?", style: TextStyle(fontSize: 13),)

              ],
            ),

          Container(
            width: size.height*0.062,
            height: size.height*0.062,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:Text("H", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
            )
          )
          ,

        ],
      ),
    );
  }
}
