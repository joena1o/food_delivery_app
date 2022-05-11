import 'package:flutter/material.dart';

import '../ItemScreen.dart';
import 'ImageCom.dart';


class ItemList extends StatefulWidget {

  ItemList({Key? key, required this.item}):super(key: key);

  final Object item;



  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {


  List Item = [];



  void initState(){

    super.initState();

    Item.add(widget.item);

  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(

        onTap: (){

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_)=> ItemScreen(item: Item[0],)
              )
          );

        },

        child:Container(

          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Container(

                  width: size.width*.3,
                  height: size.width*.3,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),

                  ),

                  child: Stack(
                    children:[

                  Container(
                      width: size.width*.3,
                      height: size.width*.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),

                      ),

                      child:ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:ImageCom(image: Item[0]['image'],)
                      )),

                      Positioned(
                          top:5,
                          left: 5,
                          child:Opacity(
                          opacity:0.6,
                          child:Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.black,
                            ),

                            child: Text("Available", style: TextStyle(color:Colors.white, fontSize: 12),)

                      )))

                    ]
                  )

              ),

              Container(
                width: size.width*.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${Item[0]['item_name']}", style: TextStyle(letterSpacing: 1),),
                    Container(height: 20,),
                    Text("N${Item[0]['item_price']}"),
                    Container(height: 20,),
                    Text(("${Item[0]['item_cat']}").toUpperCase(), style:TextStyle(fontStyle: FontStyle.italic,color: Colors.orange))
                  ],
                ),
              )

            ],

          ),

        ));
}

}
