import 'package:http/http.dart' as http;
import 'utils.dart';
import 'dart:convert';

class CheckOutClass{

  checkOut(items, user, cost, phone, qty, location, address, lat, lng) async{

    var res = await http.post(Uri.parse(conn+"/checkout"), body: jsonEncode({

      "items":items,
      "user":user,
      "cost": cost,
      "phone":phone,
      "qty": qty,
      "location": location,
      "addr":address,
      "lat": lat,
      "lng": lng

    }), headers: {"content-type":"application/json"} );


    var responsebody = res.body;


    return responsebody;


  }





}