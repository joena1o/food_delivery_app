import 'package:flutter/material.dart';

import 'ImageCom.dart';


class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Opacity(
    opacity: 0.7,
        child:Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      height: size.height*0.1,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(5)
      ),
      
      child:  Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              padding: EdgeInsets.all(5),
              width: size.width*.14,
              height: size.width*.14,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ImageCom(),
              ),
            ),
            Container(
              width: size.width*0.03,
            ),
            Container(
                width: size.width*.53,
                child:Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text("New Annoucement", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
                Container(height: 5,),
                Text("New added menu")

              ],
            )),

            Container(
                child:IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.close, size: 15,),
                )
            )


          ]

        ),

      
    ));
  }
}
