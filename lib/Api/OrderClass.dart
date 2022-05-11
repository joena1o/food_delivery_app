import 'dart:convert';

import 'package:fooddeliveryapp/Api/utils.dart';
import 'package:http/http.dart' as http;

class OrderClass{

  FetchCart(user) async{

    var res = await http.get(Uri.parse(conn+"/fetchCart/"+user));

    var response = json.decode(res.body);

    return response;

  }

  RemoveCart(id) async{

    var res = await http.get(Uri.parse(conn+"/removecart/${id}"));

    var response = res.body;

    return response;

  }


}