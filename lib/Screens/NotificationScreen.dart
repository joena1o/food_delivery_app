import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/HomeClass.dart';

import 'Widgets/NoticeList.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {

  List Notice = [];

  HomeClass home = HomeClass();

  void initState(){

    super.initState();

    FetchNotice();


  }


  FetchNotice(){

    home.FetchNotice("jonathanhyefur@gmail.com").then((value){

      setState((){

        Notice = value;

      });

    });

  }

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
                  child: Text("${Notice.length}"),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height*.79,
            child: ListView.builder(
              itemCount: Notice.length,
              itemBuilder: (BuildContext ctx, i) {
                return NoticeList(notice: [Notice[i]],);
              },
            ),
          )
        ],
      ),
    );
  }
}
