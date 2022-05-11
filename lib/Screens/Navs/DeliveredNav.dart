import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Screens/Widgets/DeliveredList.dart';
import 'package:fooddeliveryapp/Screens/Widgets/PendingOrderList.dart';

class DeliveredNav extends StatefulWidget {
  @override
  _PendingNavState createState() => _PendingNavState();
}

class _PendingNavState extends State<DeliveredNav> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(

      itemCount: 2,

      itemBuilder: (BuildContext ctx, i){

        return DeliveredList();

      },


    );
  }
}
