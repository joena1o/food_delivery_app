import 'package:flutter/material.dart';

import 'Widgets/ImageCom.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        title: Text("User Profile", style: TextStyle(fontSize: 15, color: Colors.black),),

      ),

      body: Container(

        width: size.width,
        height: size.height,
        child: ListView(
          children: [

            Container(

              width: size.width,

              margin: EdgeInsets.symmetric(vertical: 20),

              child: Column(

                children: [


                    Container(
                      width: size.width*.4,
                      height: size.width*.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                          child:ImageCom()),
                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.normal),)

                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(7),
                        child: Text("Hyefur Jonathan", style: TextStyle(fontWeight: FontWeight.bold),)

                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(7),
                        child: Text("08021388758", style: TextStyle(fontWeight: FontWeight.bold),)

                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(7),
                        child: Text("jonathanhyefur@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),)

                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(7),
                        child: Text("Address", style: TextStyle(fontWeight: FontWeight.bold),)

                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(7),
                        child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold),)

                    ),


                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.all(7),
                        child: Divider(color: Colors.grey,)

                    ),



                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(7),
                        child: Text("BigBite", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontStyle: FontStyle.italic, fontSize: 19),)

                    ),

                ],

              ),
            )

          ],
        ),

      ),



    );
  }
}
