import 'dart:convert';

import 'package:fooddeliveryapp/Api/utils.dart';
import 'package:http/http.dart' as http;

class SearchClass{
  
  
  searchItem(query) async{
    
    var res = await http.get(Uri.parse(conn+"/searchmenu/"+query));

    var response = json.decode(res.body);

    return response;
    
  }

  SearchCat(query, cat) async{

    var res = await http.post(Uri.parse(conn+"/searchcat"), body: jsonEncode({

      "cat":cat,
      'val':query

    }), headers: {"content-type":"application/json"});

    var response = json.decode(res.body);

    if(res.statusCode == 200){

      return response;

    }else{

      return "Failed";

    }

  }

  
  
}