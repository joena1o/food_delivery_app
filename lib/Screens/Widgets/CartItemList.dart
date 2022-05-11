import 'package:flutter/material.dart';

import '../ItemScreen.dart';
import 'ImageCom.dart';


class CartItemList extends StatelessWidget {

  CartItemList({Key? key, this.name, this.price, this.qty, this.id, this.cat, this.image}):super(key: key);

  var name, price, qty, id, cat, image;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

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

                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:ImageCom(image: image,)
                  )

              ),

              Container(
                width: size.width*.54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${name}"),
                    Container(height: 20,),
                    Text("Price: N${price}"),
                    Container(height: 20,),
                    Text("Quantity: ${qty}"),
                    Container(height: 20,),
                    Text("${cat}", style:TextStyle(fontStyle: FontStyle.italic,color: Colors.orange))
                  ],
                ),
              ),


            ],

          ),

        );
  }
}
