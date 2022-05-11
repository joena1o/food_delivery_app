import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fooddeliveryapp/Api/SearchClass.dart';
import 'package:fooddeliveryapp/Screens/ItemScreen.dart';

import 'Widgets/ImageCom.dart';


class Category extends StatefulWidget {

  Category({Key? key, required this.cat}):super(key: key);

  final String cat;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List Item = [];

  SearchClass search = SearchClass();

  TextEditingController query = TextEditingController();


  void initState(){

    super.initState();

    fetchCat();



  }

  fetchCat(){

    search.SearchCat(query.text, widget.cat).then((value){

      setState((){

        Item = value;

      });

    });

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(

        body: Container(

          width: size.width,
          height: size.height,
          child: SingleChildScrollView(child:Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SearchB(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("${widget.cat}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),

              Container(
                  margin: EdgeInsets.all(10),
                  width: size.width,
                  //color: Colors.grey,
                  height: size.height*0.745,
                  child: SingleChildScrollView(
                      child:StaggeredGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        children: List.generate(Item.length, (index){

                          return GestureDetector(

                              onTap: (){

                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_)=> ItemScreen(item: Item[index],)
                                )
                            );

                          },

                          child:Container(
                              width: size.width/4,
                              //height: (index%2==0)?size.height/7:size.height/4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      width: size.width*.4,
                                      height: (index%2==0)?size.width*.45:((index%3==0)?size.width*.5:size.width*.55),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child:ImageCom(image: Item[index]['image']),
                                      )
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:EdgeInsets.symmetric(vertical:10),
                                          child: Text("${Item[index]['item_name']}", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.symmetric(vertical:10),
                                          child: Text("N${Item[index]['item_price']}"),
                                        ),

                                        Padding(
                                          padding:EdgeInsets.symmetric(vertical:10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.category, color: Colors.amberAccent,),
                                              Container(width: 10,),
                                              Text(("${Item[index]['item_cat']}").toUpperCase())
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              )
                          ));

                        }),

                      )
                  ))

            ],



          ),

        )
    )));
  }


  Widget SearchB(){

    Size size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: size.width-20,
      height: size.height*.075,

      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10)
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width*.1,
            child: IconButton(
                onPressed: (){

                  Navigator.of(context).pop();

                },
                icon:Icon(Icons.keyboard_arrow_left)
            ),
          )
          ,

          Container(
            width: size.width*.65,

            child:TextField(
              controller: query,
              onChanged: (value){

                if(value.isNotEmpty){

                  search.SearchCat(value.toString(), widget.cat).then((value){

                    setState((){

                      Item = value;

                    });

                  });

                }

              },
              decoration: InputDecoration(
                hintText: "Search here",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,



              ),),
          ),
          Container(
            width: size.width*.1,
            child: IconButton(
                onPressed: (){

                },
                icon:Icon(Icons.tune)
            ),
          )
        ],
      ),


    );
  }

}
