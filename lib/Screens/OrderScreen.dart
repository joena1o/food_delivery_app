import 'package:flutter/material.dart';
import 'CheckOutPage.dart';
import 'Navs/CartNav.dart';
import 'Navs/DeliveredNav.dart';
import 'Navs/PendingNav.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin{

  late TabController controller;

  var cartPrice;

  void initState(){

    super.initState();

    controller = new TabController(length: 3, vsync: this);

  }

  setPrice(price){


    setState(() {

      cartPrice = price;

    });



  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*.87,

      child: Column(
        children: [

          Container(
            height: size.height*.09,
            color: Colors.white,
            child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: controller,
              labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 15),
            indicatorColor: Colors.orangeAccent,
            tabs: [
            Tab(text: 'Cart'),
            Tab(text: 'Pending Order',),
            Tab(text: 'Delivered'),
        ],
      ),
    ),
    ),

          Container(
            width: size.width,
            height: size.height*.77,
            child: TabBarView(
              children: [
                Container(
                  color: Colors.white,
                    width: size.width,
                    height: size.height*.77,
                    child: Stack(
                      children: [
                        CartNav(),
                        ],
                    )),
                Container(
                    width: size.width,
                    height: size.height*.75,
                    child: PendingNav()),
                Container(
                    width: size.width,
                    height: size.height*.75,
                    child: DeliveredNav()),
              ],
              controller: controller,
            ),
          )



        ],
      ),


    );
  }
}
