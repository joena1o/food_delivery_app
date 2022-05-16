import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {


  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(fontSize: 15,color: Colors.black),),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.grey[300],

      ),

      body: Container(

        width: size.width,
        height: size.height,

        child: ListView(
          children: [

            Container(

              height: 50,

            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Edit name"
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                      hintText: "Last name"
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone Number"
                ),
              ),
            ),

            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: FlatButton(
                color: Colors.orangeAccent,
                onPressed: (){

                },
                child: Text("Save Changes", style: TextStyle(color: Colors.white),),
              )
            ),

//            Container(
//                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                child: FlatButton(
//                  color: Colors.grey,
//                  onPressed: (){
//
//                  },
//                  child: Text("Cancel", style: TextStyle(color: Colors.white),),
//                )
//            )

          ],
        ),

      ),

    );
  }
}
