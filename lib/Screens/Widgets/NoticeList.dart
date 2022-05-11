import 'package:flutter/material.dart';

class NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: size.width,
      color: Colors.grey[100],
      child: Text("New Notification Appeared, your order has been confirmed"),

    );
  }
}
