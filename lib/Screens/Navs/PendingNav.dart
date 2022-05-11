import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Screens/Widgets/PendingOrderList.dart';

class PendingNav extends StatefulWidget {
  @override
  _PendingNavState createState() => _PendingNavState();
}

class _PendingNavState extends State<PendingNav> {
  @override
  Widget build(BuildContext context) {

    List pending = [];

    Size size = MediaQuery.of(context).size;

    return ListView.builder(

        itemCount: pending.length+1,

        itemBuilder: (BuildContext ctx, i){

          return PendList();

        },


    );
  }
}
