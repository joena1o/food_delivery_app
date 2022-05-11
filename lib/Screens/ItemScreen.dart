import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/ProductClass.dart';

import 'Widgets/ImageCom.dart';

class ItemScreen extends StatefulWidget {

  ItemScreen({Key? key, this.item}):super(key: key);

  final item;

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  List Item = [];
  bool cart = false;

  bool order = false;

  TextEditingController review_text = TextEditingController();

  bool review = false;

  double rating = 3.0;

  int qty = 1;

  ProductClass product = ProductClass();


  void initState(){

    super.initState();

    Item.add(widget.item);

  }


  SetQty(op){

    if(op == "Add"){

      setState((){

        qty++;

      });

    }else{

      if(qty > 1){

        setState((){

          qty--;

        });

      }


    }



  }


  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              expandedHeight: 240.0,
              floating: false,
              leading: Padding(
                  padding: EdgeInsets.only(left: 14, top:8, bottom: 8),
                  child:CircleAvatar(
                    radius: 10,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                child: IconButton(

                  onPressed: (){

                    Navigator.of(context).pop();

                  },
                  icon: Icon(Icons.keyboard_backspace),
                ),
              )),
              actions: [

                Container(
                    padding: EdgeInsets.only(right: 14),
                    child:CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: IconButton(

                        onPressed: (){

                              showDialog(
                                context: context,
                                builder: (_){

                                  return
                                     Center(child:CircularProgressIndicator(color: Colors.orange,)
                                     );

                                }

                          );

                              product.AddToFav("jonathanhyefur@gmail.com", (Item[0]['item_id']).toString()).then((value){

                                Navigator.of(context).pop();

                                setState((){

                                  if(value == "removed"){
                                    cart = false;
                                    _showMessage("Removed from favourites");
                                  }
                                  else if(value == "done"){
                                    cart = true;
                                    _showMessage("Added to favourites");
                                  }



                                });

                              });

                        },
                        icon: Icon((!cart)?Icons.bookmark_add_outlined:Icons.bookmark),
                      ),
                    ))

              ],
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,

                  background: ImageCom(image:Item[0]['image']),
            ),
            )];
        },
        body: WillPopScope(

        onWillPop: ()async{

          if(order==true){

            setState((){

              order = !order;



                });

              }else if(review==true){

                  setState((){

                    review = !review;

                  });

                }
              else{


                Navigator.of(context).pop();

                }

                return false;

          },

        child:Container(



        child: Stack(

          children: [

            Positioned(child:Container(

              padding: EdgeInsets.symmetric(horizontal: 20),


              child:ListView(

              children: [


                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),

                  child: Text("Available", style: TextStyle(fontSize: 15, color:Colors.green, fontWeight: FontWeight.bold),),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 20),

                  child: Text("${Item[0]['item_name']}", style: TextStyle(fontSize: 21),),
                ),

                Text("Dish"),

                Container(
                  height: 20,
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 15),

                  child: Text("Price", style: TextStyle(fontSize: 18, color: Colors.black),),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10),

                  child: Text("N${Item[0]['item_price']}", style: TextStyle(fontSize: 15, color:Colors.grey),),
                ),


                Padding(padding: EdgeInsets.symmetric(vertical: 18),

                  child: Text("Description", style: TextStyle(fontSize: 18, color: Colors.black),),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10),

                  child: Text("${Item[0]['item_desc']}", style: TextStyle(fontSize: 15, color:Colors.grey),),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                  child: Divider(color: Colors.grey,),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10),

                  child: Center(child:Text("Review", style: TextStyle(fontSize: 17, color:Colors.red, fontWeight: FontWeight.bold),)),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 20),

                  child: Center(child:FlatButton(
                    onPressed: (){

                      setState((){

                        review = true;

                      });

                    },
                    color: Colors.black,
                    child: Text("Submit Review", style: TextStyle(color:Colors.white),),
                  )),
                ),



              ],

            ))),

            Visibility(
                visible: review,
                child:Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    width: size.width,
                    height: size.height*0.54,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("New Review", style: TextStyle(fontSize: 17),),
                          ),

                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
//                                border: Border.all(color: Colors.grey),
//                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: review_text,
                              maxLines: 2,
                              decoration: InputDecoration(
                                  hintText: "Type and submit a review...",
//                                  border: InputBorder.none
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Slider(
                              onChanged: (double value){
                                setState(() {
                                  rating = ((value).round()).toDouble();
                                });
                              },
                              value: rating.toDouble(),
                              min: 0,
                              max: 5,
                              divisions: 5,
                              activeColor: Colors.black,
                            ),
                          ),

                          Container(
                            child: Text("Rating: ${rating}")
                            ,
                          )
                        ],
                      ),
                    ),
                  //),
                )),

            Visibility(
                visible: order,
                child:Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height*.5,
                color: Colors.white,
                child: ListView(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            width: size.width*0.30,
                            height: size.width*0.30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:ImageCom(image: Item[0]['image'])
                            ),

                          ),

                          Container(
                            width: size.width*0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("${Item[0]['item_name']}", style: TextStyle(fontSize:16)),
                                SizedBox(height: 10,),
                                Text("N${Item[0]['item_price']}", style: TextStyle(fontSize:16, color:Colors.deepOrange)),
                                SizedBox(height: 30,),
                                Text("Quantity:", style: TextStyle(fontSize:15),),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right:15),
                                      //padding: EdgeInsets.all(10),
                                      decoration:BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:BorderRadius.circular(10)
                                      ),

                                      child: IconButton(
                                        onPressed: (){
                                          SetQty("min");
                                        },
                                        icon:Icon(Icons.exposure_minus_1, size:20, color:Colors.black)),
                                    ),
                                    Text("${qty}"),
                                    Container(
                                      margin: EdgeInsets.only(left:15),
                                      //padding: EdgeInsets.all(10),
                                      decoration:BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius:BorderRadius.circular(10)
                                      ),

                                      child: IconButton(
                                          onPressed: (){
                                            SetQty("Add");
                                          },
                                          icon:Icon(Icons.add, size:20, color:Colors.white)),
                                    ),

                                  ],
                                )

                              ],
                            ),

                          )

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ))

          ],

        )
      ),
    )),
    
      bottomNavigationBar: BottomAppBar(
        
        child: Padding(
          padding: EdgeInsets.all(10),
          child: (!order && !review)?Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: size.width*.82,
                height: size.height*.06,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(

                  onTap: (){

                    setState((){

                      order = true;

                    });

                  },
                  child: Center(child:Text("Order Now", style: TextStyle(color:Colors.white, fontSize: 17),)),
                ),
              )
              
            ],
          ):((order)?Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: size.width*.15,
                height: size.height*.06,
                decoration: BoxDecoration(
//                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                  onPressed: (){
                    
                    product.AddToCart("jonathanhyefur@gmail.com", Item[0]['item_id'], qty).then((value){


                      if(value != "failed"){

                        _showMessage("Order added to cart");

                      }

                    });

                  },
                  icon: Icon(Icons.shopping_bag),
                ),
              ),

              Container(
                width: size.width*.67,
                height: size.height*.06,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: GestureDetector(

                  onTap: (){

                    setState((){

                      order = false;

                    });

                  },
                  child: Center(child:Text("Order Only", style: TextStyle(color:Colors.white, fontSize: 15),)),
                ),
              )

            ],
          ):Container(
            width: size.width*.82,
            height: size.height*.06,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            child: GestureDetector(

              onTap: (){

                setState((){

                  order = true;

                });

              },
              child: Center(child:Text("Submit Review", style: TextStyle(color:Colors.white, fontSize: 14),)),
            ),
          )),
          
        ),
        
      ),
      
    );
}}
