import 'package:flutter/material.dart';
import '../Category.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List catItem = ["burger.png", "cuba-libre.png", "ice-cream.png", "meal.png", 'ice-cream.png'];

  List Items = ['Fastfood', 'Drinks', 'Snack', 'Dish', 'Dessert'];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*0.12,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, i){

          return Column(
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_)=> Category(cat: Items[i]))
                  );
                },
              child:Container(
                margin: EdgeInsets.symmetric(horizontal: 21),
                padding: EdgeInsets.all(7),


                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(14)

                ),
                child: Image(
                  width: size.height*.043,
                  image: AssetImage("assets/"+catItem[i]),
                ),

              )),

              Container(height: 14,),

              Text(Items[i], style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, color: Colors.black, letterSpacing: 1),),


            ],
          );

        },
      ),



    );
  }
}
