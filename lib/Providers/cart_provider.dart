
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier{

  int cartCount = 0;

  int get cart => cartCount;


  void increment(val){

    if(val=="d")
    cartCount++;
    else cartCount--;

    notifyListeners();

  }



}