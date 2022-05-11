import 'package:fooddeliveryapp/Api/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductClass{


  AddToFav(user, id) async{


    var res = await http.post(Uri.parse(conn+"/addToFav"), body: jsonEncode({
      "user": user,
      "id": id
    }), headers: {"content-type":"application/json"});

    var response = res.body;


    if(response=="success"){

      return "done";


    }else if(response == "removed")

      return "removed";

    else{

      return "failed";


    }



  }


  AddToCart(user, id, qty) async{


    var res = await http.post(Uri.parse(conn+"/addToCart"), body: jsonEncode({
      "user": user,
      "id": id,
      "quantity":qty
    }), headers: {"content-type":"application/json"});

    var response = res.body;


    if(response=="success"){

      return "done";


    }else if(response == "done")

      return "Added";

    else{

      return "failed";


    }



  }




  FetchFavorite(user) async{

    var res = await http.get(Uri.parse(conn+"/fetchFav/"+user));

    var response = json.decode(res.body);

    return response;

  }


}