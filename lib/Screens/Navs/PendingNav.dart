import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/OrderClass.dart';
import 'package:fooddeliveryapp/Screens/Widgets/PendingOrderList.dart';

class PendingNav extends StatefulWidget {
  @override
  _PendingNavState createState() => _PendingNavState();
}

class _PendingNavState extends State<PendingNav> {


  List pending = [];

  OrderClass orderClass = OrderClass();


  FetchPending(){

    orderClass.FetchPending("jonathanhyefur@gmail.com").then((value){

      setState(() {

        pending = value;


      });

    });

  }


  void initState(){

    super.initState();


    FetchPending();



  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(

        itemCount: pending.length,

        itemBuilder: (BuildContext ctx, i){

          return PendList(data: pending[i]);

        },


    );
  }
}
