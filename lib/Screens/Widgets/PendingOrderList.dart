import 'package:flutter/material.dart';

import '../Tracking.dart';
import 'ImageCom.dart';

class PendList extends StatefulWidget {

  PendList({Key? key, this.data}):super(key:key);

  var data;

  @override
  _PendListState createState() => _PendListState();
}

class _PendListState extends State<PendList> {

  List Data = [];

  void initState(){

    super.initState();


    setState((){

      Data = [widget.data];

    });





  }

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
                width: size.width*.3,
                height: size.width*.3,
                decoration: BoxDecoration(

                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:Image(
                      image: AssetImage("assets/tracking.png"),
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
                      child: Text("${Data[0]['order_items']}"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Price: N${Data[0]['cost']}"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Quantity: ${Data[0]['quantity']}"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Order Date: ${(Data[0]['date'])}"),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Order Time: ${Data[0]['time']}"),
                    ),








                  ],
                ),
              )

            ],
          ),

        ),

        Container(

          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: FlatButton(
            onPressed: (){

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_)=> LocationTrack()
                  )
              );

            },
            color: Colors.red,
            child: Text("Track Order", style: TextStyle(color: Colors.white),),
          ),
        ),

        Container(

          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: FlatButton(
            onPressed: (){

            },
            color: Colors.orange,
            child: Text("Confirm Received", style: TextStyle(color: Colors.white),),
          ),
        )



      ],

    );
  }
}
