import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/HomeClass.dart';
import 'package:fooddeliveryapp/Providers/cart_provider.dart';
import 'package:provider/src/provider.dart';
import 'NotificationScreen.dart';
import 'OrderScreen.dart';
import 'SavedScreen.dart';
import 'SearchScreen.dart';
import 'Widgets/Categories.dart';
import 'Widgets/HomeNav.dart';
import 'Widgets/ImageCom.dart';
import 'Widgets/ItemList.dart';
import 'Widgets/SearchBar.dart';
import 'Widgets/Banner.dart';
import 'Widgets/TrendingItems.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var nav = 1;

  List menuItem = [];

  HomeClass home = new HomeClass();

  void initState(){

    super.initState();

    fetchMenu();

  }

  fetchMenu(){

    home.getMenu().then((value){

      setState(() {

        menuItem = value;

      });

    });

  }

  changeNav(i){


    setState((){

      nav = i;

    });

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(child:Scaffold(

      body: (nav == 1)?HomeScreen(context):((nav == 2)?SearchScreen(callBack:changeNav):((nav == 3)?Saved():

      (nav==4)?NotificationScreen():OrderScreen())),


      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: size.height*.05,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    GestureDetector(
                    onTap:(){
                  changeNav(1) ;
                  },
                child:Image(
                  width: 25,
                  image: AssetImage("assets/home.png"),
                )),
                (nav==1)?Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50)
                  ),

                  padding: EdgeInsets.all(3),
                ):Container()
              ]
            )),
            Container(
                height: size.height*.05,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    GestureDetector(
                    onTap:(){
                    changeNav(2) ;
                    },
                child:Image(
                        width: 25,
                        image: AssetImage("assets/searchicon.png"),
                      )),
                (nav==2)?Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)
                        ),

                        padding: EdgeInsets.all(3),

                      ):Container()
                    ]
                )),

            Container(
                height: size.height*.05,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          changeNav(3) ;
                        },
                        child:Image(
                        width: 25,
                        image: AssetImage("assets/saveicon.png"),
                      )),
                      (nav==3)?Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)
                        ),

                        padding: EdgeInsets.all(3),

                      ):Container()
                    ]
                )),
            Container(
                height: size.height*.05,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap:(){
                            changeNav(4) ;
                          },
                          child:Image(
                            width: 25,
                            image: AssetImage("assets/notify.png"),
                          )),
                      (nav==4)?Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)
                        ),

                        padding: EdgeInsets.all(3),

                      ):Container()
                    ]
                )),
            GestureDetector(
              onTap:(){
                changeNav(5) ;
              },
              child:Stack(
              children: [

                Positioned(

                    child:CircleAvatar(
                  radius: 14.7,
                  backgroundColor: Colors.orangeAccent,
                  child: Icon(Icons.shopping_cart,size: 19,color: Colors.white,),
                )),

                Visibility(
                    visible:(context.watch<CartProvider>().cart != 0)?true:false,
                    child:Positioned(
                  right: 0,
                  top:0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text("${context.watch<CartProvider>().cart}", style: TextStyle(fontSize: 10),),
                  ),
                ))
              ],
            ))

          ],
        )),
      ),



    ));
  }


  Widget HomeScreen(context){

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.white,
      height: size.height,
      child: ListView(

        children: [

          HomeNav(),

          Container(
            width: size.width,
            height: size.height*0.77,
            color: Colors.white,
            child: (menuItem!=[])?ListView.builder(
                itemCount: menuItem.length+1,
                itemBuilder: (BuildContext ctx, i) {
                  if (i == 0) {
                    return Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Container(

                          padding: EdgeInsets.only(
                              left: 23, right: 23, top: 35, bottom: 10),
                          width: size.width,

                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Icon(Icons.location_on, size: 30, color: Colors.deepOrange,),

                              Container(
                                width: size.width*.70,
                                child: Text("Kofare Industrial Layout, Wurro Jabbe", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),),
                              ),

                              Icon(Icons.arrow_drop_down, size: 30, color: Colors.deepOrange,),

                            ],
                          ),

                        ),


                        GestureDetector(
                            onTap:(){

                              changeNav(2);

                            },
                            child:SearchBar()),

                        //Banners(),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[

                              Text("Categories",
                                style: TextStyle(fontSize: 16, letterSpacing: 1),),
                              Text("See all",
                                style: TextStyle(fontSize: 14),),

                            ]
                          )
                        ),


                        Categories(),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          child: Text("Popular Dishes",
                            style: TextStyle(fontSize: 16, letterSpacing: 1),),
                        ),


                        TrendingItems(item: menuItem),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Text(
                            "Menu Items", style: TextStyle(fontSize: 16),),
                        ),

                      ],

                    );
                  } else {
                    return ItemList(item: menuItem[i-1],);
                  }
                }):Center(
              child: CircularProgressIndicator(),
            ),

          )

        ],
      ),
    );


  }



}
