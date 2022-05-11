import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fooddeliveryapp/Api/SearchClass.dart';
import 'package:fooddeliveryapp/Screens/ItemScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Widgets/ImageCom.dart';

class SearchScreen extends StatefulWidget {

  SearchScreen({Key? key, required this.callBack}):super(key: key);

  final Function callBack;



  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  TextEditingController search = TextEditingController();

  SearchClass sclass = SearchClass();

  List SearchData = [];


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
            height: size.height,
            child:ListView(
          children: [

            SearchB(),

            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              height: size.height*0.74,
              child: SingleChildScrollView(
              child:StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: List.generate(SearchData.length, (index){

                  return GestureDetector(

                      onTap: (){

                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_)=> ItemScreen(item: SearchData[index],)
                        )
                    );

                  },

                  child:Container(
                    width: size.width/4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: size.width*.4,
                          height: (index%2==0)?size.width*.45:((index%3==0)?size.width*.5:size.width*.55),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:ImageCom(image: SearchData[index]['image'],),
                          )
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:EdgeInsets.symmetric(vertical:10),
                                child: Text("${SearchData[index]['item_name']}", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(vertical:10),
                                child: Text("N${SearchData[index]['item_price']}"),
                              ),

                              Padding(
                                padding:EdgeInsets.symmetric(vertical:10),
                                child: Row(
                                  children: [
                                    Icon(Icons.category, color: Colors.amberAccent,),
                                    Container(
                                      width: 5,
                                    ),
                                    Text(("${SearchData[index]['item_cat']}").toUpperCase())
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
      ),
    ));
  }

  Widget SearchB(){

    Size size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: size.width,
      height: size.height*.08,

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

                    widget.callBack(1);

                  },
                  icon:Icon(Icons.keyboard_arrow_left)
              ),
            )
            ,

            Container(
              width: size.width*.65,

              child:TextField(
                controller: search,
              onChanged: (value){


                  if(value.isNotEmpty){


                    sclass.searchItem(value).then((value){


                      setState((){

                        SearchData = value;

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
