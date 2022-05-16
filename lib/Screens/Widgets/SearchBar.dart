import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search,size: 24,),
          Container(width: 20,),
          Container(
            width: size.width*0.57,
            child: Text("Search Desired foods", style: TextStyle(fontSize: 14, color:Colors.black54, fontWeight: FontWeight.normal),),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child:Icon(Icons.tune))

        ],
      ),
    );
  }
}
