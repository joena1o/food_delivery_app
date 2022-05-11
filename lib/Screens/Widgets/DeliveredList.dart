import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Screens/Tracking.dart';

import 'ImageCom.dart';

class DeliveredList extends StatefulWidget {
  @override
  _DeliveredListState createState() => _DeliveredListState();
}

class _DeliveredListState extends State<DeliveredList> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Container(

          width: size.width,

          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: size.width*.25,
                height: size.width*.25,
                decoration: BoxDecoration(

                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:Image(
                      image: AssetImage("assets/box.png"),
                    )),
              ),

              Container(
                width: size.width*.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Lasagna and cheese"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Price: N5000"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Quantity: 3"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Delivery Date: 27/06/2021"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Delivery Time: 3:00pm"),
                    ),






                  ],
                ),
              )

            ],
          ),

        ),

        Container(

          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: FlatButton(
            onPressed: (){



            },
            color: Colors.red,
            child: Text("Send Us Feedback", style: TextStyle(color: Colors.white),),
          ),
        ),




      ],

    );
  }
}
