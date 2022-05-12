import 'package:flutter/material.dart';

import 'ImageCom.dart';


class TrendingItems extends StatefulWidget {

  TrendingItems({Key? key, required this.item}):super(key: key);

  final List item;

  @override
  _TrendingItemsState createState() => _TrendingItemsState();
}

class _TrendingItemsState extends State<TrendingItems> {

  List Item = [];

  void initState(){

    super.initState();

    Item =  widget.item;


  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height*.35,
      child: ListView.builder(
//        reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: Item.length,
          itemBuilder: (BuildContext ctx, i){

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: size.width*.66,
              height: size.height*.35,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
                
              ),
              child: Stack(
                children: [

                  Positioned(

                    top: 0,
              child:Container(
//              margin: EdgeInsets.symmetric(horizontal: 20),
                width: size.width*.66,
                height: size.height*.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)


                ),
                child:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:ImageCom(image: Item[i]['image'],))

              )

                  ),

                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.7,
                      child:Container(
                      margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      height: size.height*.17,
                      width: (size.width*0.66)-10,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: size.width*.4,
                                child: Text("${Item[i]['item_name']}", overflow: TextOverflow.fade, style: TextStyle(color: Colors.white, fontSize: 16),),
                              ),

                              Container(
                                width: size.width*.4,
                                child: Text("N${Item[i]['item_price']}", overflow: TextOverflow.fade, style: TextStyle(color: Colors.white, fontSize: 16),),
                              ),

                            ],

                          ),

                          IconButton(
                              onPressed: (){

                                _showMessage("Add to favourites");
                                
                              },
                              icon:Icon(Icons.bookmark_add_outlined, color: Colors.white,))
                        ],
                      ),
                    )),
                  ),

                  Positioned(
                      top:10,
                      left: 10,
                      child:Opacity(
                          opacity:0.6,
                          child:Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:(Item[i]['status']=="available")?Colors.black:Colors.red,
                              ),

                              child: Text("${Item[i]['status']}", style: TextStyle(color:Colors.white, fontSize: 12),)

                          )))
                ],
              ),
            );

      })
    );
  }
}
