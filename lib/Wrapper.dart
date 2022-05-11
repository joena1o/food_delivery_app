import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';
import 'Screens/WelcomeScreen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
