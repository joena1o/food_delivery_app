import 'package:flutter/material.dart';

class NoticeList extends StatelessWidget {

  NoticeList({Key?key, this.notice}):super(key: key);

  var notice;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: size.width,
      color: Colors.grey[100],
      child: (notice[0]['notice_type']=="confirm")?
      Text("Your Order has been confirmed and will be prepared for delivery shortly", style: TextStyle(fontWeight: FontWeight.bold),
          ):Text("Your order has been pack and ready for delivery",style: TextStyle(fontWeight: FontWeight.bold)),

    );
  }
}
