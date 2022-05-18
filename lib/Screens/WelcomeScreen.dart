import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/Auth.dart';

import 'HomeScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool signup = false;
  bool signIn = false;

  TextEditingController name = TextEditingController();
  TextEditingController lname = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();


  TextEditingController cpass = TextEditingController();


  var _formkey = GlobalKey<FormState>();


  Auth auth = Auth();


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return WillPopScope(
      onWillPop: ()async{


        showDialog(
          context: context,
          builder: (_){

            return AlertDialog(

              title: Text("Exit?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              content: Text("Do you wish to exit?", style: TextStyle(fontSize: 14),),
              actions: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"),
                )
              ],

            );

          }
        );


        return false;

      },
        child:Scaffold(

      body: Container(

        width: size.width,
      height: size.height,

      child: Stack(

        children: [

          Positioned(
              child: Opacity(
                  opacity: 1,
                  child:Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage("assets/spagetti.jpg"), fit: BoxFit.cover)
                    ),
                    child: Center(
                      child: Text(""),
                    ),
                  ) )),

          Positioned(
              child: Opacity(
                  opacity: 0.7,
                  child:Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: Center(
                      child: Text(""),
                    ),
                  ) )),




      (!signup && !signIn)?Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [

                  Container(
                      width: size.width*.7,
//                      margin: EdgeInsets.symmetric(vertical: 40),
                      child: Text("BigBite", style: TextStyle(fontSize: 29, color: Colors.white
                          ,fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),)
                  ),



                  Container(
                    width: size.width*.7,
                    margin: EdgeInsets.symmetric(vertical: 80),
                    child: Text("Order top notch cuisine and delicacies", style: TextStyle(fontSize: 20, color: Colors.white
                    ,fontStyle: FontStyle.italic),)
                  ),

                  Container(
                    width: size.width*.8,
                    height: size.height*.07,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      onPressed:(){


                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_)=> HomeScreen()
                            )
                        );

//                      setState((){
//
//                        signIn = true;
//
//                      });

                      },
                      color: Colors.red,
                      child: Text("Sign up with Google", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),

                  Container(
                    width: size.width*.8,
                    height: size.height*.07,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      onPressed:(){

                        setState(() {
                          signup = !signup;
                        });

                      },
                      color: Colors.orangeAccent,
                      child: Text("Sign Up", style: TextStyle(fontSize: 15)),
                    ),
                  ),



                ],
              ),
            ),
          ):((signIn)? Positioned(

        child:Container(
          width: size.width,
          margin: EdgeInsets.all(40),
          height: size.height,
          color: Colors.white,
          child: SignIn(size),
        ),
      ):Positioned(

            child:Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
              height: size.height,
              color: Colors.white,
              child: SignUp(size),
            ),
          )),

        ],
      ),

      )));
  }

  Widget SignUp(size){

    return Form(

      key: _formkey,

        child:ListView(

      children: [

                    Container(
                      width: size.width*.7,
                      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("BigBite", style: TextStyle(fontSize: 29, color: Colors.orange
                              ,fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),

                          FlatButton(
                            onPressed: (){
                              setState((){

                                signIn = true;

                              });
                            },
                            child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.orange
                                ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                          )

                        ],
                      )
                  ),

          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: name,
              validator: (value){

                if(value == null || value=="" || value.isEmpty)
                  return "Fill in Required field";

              },
              style: TextStyle(color:Colors.black),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                hintText: "First Name",

              ),
            ),
          ),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: lname,
                        validator: (value){

                          if(value == null || value=="" || value.isEmpty)
                            return "Fill in Required field";

                        },
                        style: TextStyle(color:Colors.black),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Last Name"
                        ),
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: phone,
                        validator: (value){

                          if(value == null || value=="" || value.isEmpty)
                            return "Fill in Required field";

                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(color:Colors.black),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Phone Number",
                        ),
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: email,
                        validator: (value){

                          if(value == null || value=="" || value.isEmpty)
                            return "Fill in Required field";

                        },
                        style: TextStyle(color:Colors.black),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Email Address"
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        obscureText: true,
                        controller: pass,
                        validator: (value){

                          if(value == null || value=="" || value.isEmpty)
                            return "Fill in Required field";

                        },
                        style: TextStyle(color:Colors.black),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Enter Password"
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        obscureText: true,
                        controller: cpass,
                        validator: (value){

                          if(value == null || value=="" || value.isEmpty)
                            return "Fill in Required field";

                        },
                        style: TextStyle(color:Colors.black),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Confirm Password"
                        ),
                      ),
                    ),



                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            color: Colors.deepOrange,
                            onPressed: (){

//                                if(_formkey.currentState.validate()){
//
//                                }




                                auth.RegisterUser(name.text, lname.text, email.text, phone.text, pass.text).then((value){

                                  if(value=='reg')
                                    {
                                      setState((){
                                        signIn = true;
                                      });
                                    }


                                });


                            },
                            child: Text("Sign Up", style: TextStyle(color:Colors.white, fontSize: 14),),
                          ),
                          Container(
                            width: 10,
                          ),
                          FlatButton(
                            color: Colors.grey,
                            onPressed: (){

                              setState(() {
                                signup = !signup;
                              });


                            },
                            child: Text("Cancel", style: TextStyle(color:Colors.white)),
                          )
                        ],
                      )
                    ),

        Container(
          padding: EdgeInsets.all(10),
          child: Divider(color:Colors.grey)
        ),

        Container(
          padding: EdgeInsets.all(15),
          child:Center(child:Text("Or"))
        ),

        Container(
            padding: EdgeInsets.all(15),
            child:Center(child:Text("Sign Up With", style: TextStyle(color:Colors.grey),))
        ),

        Container(
            padding: EdgeInsets.all(20),
            child:Center(child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,

                  child: Text("G", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                ),
                CircleAvatar(
                  radius: 24,
                  child: Text("f", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                )
              ],
            ))
        ),


      ],

    ));


  }


  Widget SignIn(size){

    return Form(

        key: _formkey,

        child:ListView(

          children: [

            Container(
                width: size.width*.7,
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("BigBite", style: TextStyle(fontSize: 29, color: Colors.orange
                        ,fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),

                    FlatButton(
                      onPressed: (){
                        setState((){

                          signIn = false;

                        });
                      },
                      child: Text("Sign Up", style: TextStyle(fontSize: 20, color: Colors.orange
                          ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                    )

                  ],
                )
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: email,
                validator: (value){

                  if(value == null || value=="" || value.isEmpty)
                    return "Fill in Required field";

                },
                style: TextStyle(color:Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Email Address",

                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: lname,
                validator: (value){

                  if(value == null || value=="" || value.isEmpty)
                    return "Fill in Required field";

                },
                style: TextStyle(color:Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Password"
                ),
              ),
            ),




            Container(
                padding: EdgeInsets.all(20),
                child: Row(

                  children: [
                    FlatButton(
                      color: Colors.deepOrange,
                      onPressed: (){

//                                if(_formkey.currentState.validate()){
//
//                                }

                      auth.LoginUser(email.text, pass.text).then((value){

                        if(value=="deny"){
                          showDialog(
                            context: context,
                            builder: (_){
                              return AlertDialog(
                                title: Text("Loggin Status", style: TextStyle(fontSize: 14),),
                                content: Text("User not recognised", style: TextStyle(fontSize: 16),),
                                actions: [
                                  FlatButton(
                                    onPressed:(){

                                      Navigator.of(context).pop();

                                    },
                                    child: Text("Ok"),
                                  )
                                ],
                              );
                            }
                          );
                        }else{

                          showDialog(
                              context: context,
                              builder: (_){
                                return AlertDialog(
                                  title: Text("Loggin Status", style: TextStyle(fontSize: 14),),
                                  content: Text("Access Granted", style: TextStyle(fontSize: 16),),
                                  actions: [
                                    FlatButton(
                                      onPressed:(){

                                        Navigator.of(context).pop();

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_)=> HomeScreen()
                                          )
                                        );

                                      },
                                      child: Text("Ok"),
                                    )
                                  ],
                                );
                              }
                          );


                        }

                      });

                      },
                        child: Text("Sign In", style: TextStyle(color:Colors.white),),
                    ),
                    Container(
                      width: 10,
                    ),
                    FlatButton(
                      color: Colors.grey,
                      onPressed: (){

                        setState(() {
                          signIn = !signIn;
                        });


                      },
                      child: Text("Cancel", style: TextStyle(color:Colors.white)),
                    )
                  ],
                )
            ),

            Container(
                padding: EdgeInsets.all(10),
                child: Divider(color:Colors.grey)
            ),

            Container(
                padding: EdgeInsets.all(15),
                child:Center(child:Text("Or"))
            ),

            Container(
                padding: EdgeInsets.all(15),
                child:Center(child:Text("Sign In With", style: TextStyle(color:Colors.grey),))
            ),

            Container(
                padding: EdgeInsets.all(30),
                child:Center(child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,

                      child: Text("G", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    ),
                    CircleAvatar(
                      radius: 24,
                      child: Text("f", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    )
                  ],
                ))
            ),


          ],

        ));


  }

}
