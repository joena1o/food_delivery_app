import 'package:flutter/material.dart';

import 'Widgets/NoticeList.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height ,
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * .084,
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 16),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  child: Text("10"),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height*.79,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext ctx, i) {
                return NoticeList();
              },
            ),
          )
        ],
      ),
    );
  }
}
