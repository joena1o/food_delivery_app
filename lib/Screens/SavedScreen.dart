import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/ProductClass.dart';

import 'Widgets/ImageCom.dart';


class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {

  List saved = [];

  ProductClass products = ProductClass();

  fetchFav(){

    products.FetchFavorite("jonathanhyefur@gmail.com").then((value){

      setState((){

        saved = value;

      });

    });

  }


  void initState(){

    super.initState();

      fetchFav();

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*.9,
//      padding: EdgeInsets.all(14),

      child: Column(
        children: [

          Container(
            width: size.width,
            height: size.height*.09,
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favourite", style: TextStyle(fontSize: 16),),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  child: Text("${saved.length}"),
                )
              ],
            ),
          ),

          Container(
            width: size.width,
            height: size.height*.77,

            child: ListView.builder(
                itemCount: saved.length,
                itemBuilder: (BuildContext ctx, i){

                  return Container(

                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Container(

                            width: size.width*.3,
                            height: size.width*.3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),

                            ),

                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:ImageCom(image: saved[i]['image'],)
                            )

                        ),

                        Container(
                          width: size.width*.52,
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${saved[i]['item_name']}"),
                              Container(height: 20,),
                              Text("N${saved[i]['item_price']}", style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),),
                              Container(height: 20,),
                              Text("Dish", style:TextStyle(fontStyle: FontStyle.italic,color: Colors.orange))
                            ],
                          ),
                        )

                      ],

                    ),

                  );


                }),
          )

        ],
      ),

    );
  }
}
