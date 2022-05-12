import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Api/OrderClass.dart';
import 'package:fooddeliveryapp/Screens/Widgets/ItemList.dart';
import '../CheckOutPage.dart';
import '../Widgets/CartItemList.dart';

class CartNav extends StatefulWidget {

  CartNav({Key? key, this.callBack}):super(key: key);


  var callBack;

  @override
  _CartNavState createState() => _CartNavState();
}

class _CartNavState extends State<CartNav> {

  OrderClass order = OrderClass();

  List cart = [];

  fetchCart(){

    order.FetchCart("jonathanhyefur@gmail.com").then((value){

      setState(() {

         cart = value;

      });


    });

  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  
  estimatePrice(){
    
    var price = 0.00;
    
    for(var i =0; i<cart.length; i++){
      
        price += (cart[i]['item_price'] * cart[i]['quantity']);

      
    }

     return price;
    
  }

  ProcessOrder(){

    var order = "";

    for(var i =0; i<cart.length; i++){

      order += "${cart[i]['item_name']}" + "(${cart[i]['quantity']}) ";

    }

   return order;

  }

  estimateQuantity(){

    var qty = 0.00;

    for(var i =0; i<cart.length; i++){

      qty += (cart[i]['quantity']);


    }

    return qty;


  }


  void initState(){

    super.initState();

    fetchCart();

  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Stack(

        children:[

          ListView.builder(

            itemCount: cart.length,
            itemBuilder: (BuildContext ctx, i){

              return GestureDetector(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (_)=> ModalBottom(context, cart[i]['cart_id'], i));
                  },
                  child:CartItemList(name: cart[i]['item_name'], price: cart[i]['item_price'], cat: cart[i]['item_cat'],
                    qty: cart[i]['quantity'], id: cart[i]['item_id'], image: cart[i]['image'],
                  ));

            },




          ),

          Positioned(
              bottom: size.height*.1,
              right: size.width*.1,
              child: GestureDetector(
                  onTap: (){

                    if(cart.length==0)
                      return;
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_)=> CheckOutPage(price: estimatePrice(), cart: cart, order: ProcessOrder(), qty: estimateQuantity(),)
                        )
                    );
                  },
                  child:Container(
                    decoration: BoxDecoration(
                        color: (cart.length==0)?Colors.grey:Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(250, 250, 250, 1),
                              spreadRadius: 4,
                              blurRadius: 1
                          )
                        ]

                    ),
                    padding: EdgeInsets.all(10),
                    child: Text("CheckOut", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
              )
          )


        ]);
  }



  Widget ModalBottom(context, id, index){

    Size size = MediaQuery.of(context).size;

    return Container(

      height: size.height*0.4,

        child:Column(

      children: [

        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [

              CircleAvatar(
                backgroundColor:Colors.orange,
                foregroundColor: Colors.white,
                child: Icon(Icons.edit),
              ),

              Container(
                width: 20,
              ),

              Text("Edit")

            ],
          ),
        ),

        GestureDetector(
            onTap: (){



              Navigator.of(context).pop();

              order.RemoveCart(id).then((value){

                print(value);

                if(value == "success"){

                  Navigator.of(context).pop();

                  setState((){

                    cart.removeAt(index);

                  });

                  _showMessage("1 item removed from cart");


                }

              });

              showDialog(
                context: context,
                builder: (_)=> Center(

                  child: CircularProgressIndicator(color: Colors.deepOrange,),

              )
              );

            },
            child:Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [

              CircleAvatar(
                backgroundColor:Colors.orange,
                foregroundColor: Colors.white,
                child: Icon(Icons.delete),
              ),

              Container(
                width: 20,
              ),

              Text("Remove")

            ],
          ),
        ))

      ],

    ));

  }





}
