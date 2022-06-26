import 'dart:async';

import 'package:flutter/material.dart';

import 'Screens/Booting.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/WelcomeScreen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  bool booted = false;

  void initState(){

    super.initState();


    Boot();

  }

  void Boot(){

    Timer(Duration(
      seconds: 3
    ), (){

      setState((){

        booted = true;

      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return (booted==false)?BootingScreen():WelcomeScreen();
  }
}
