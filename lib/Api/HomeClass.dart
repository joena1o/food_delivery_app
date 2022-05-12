import 'dart:convert';

import 'package:fooddeliveryapp/Api/utils.dart';
import 'package:http/http.dart' as http;

class HomeClass{

  getMenu() async{

    try{

      var res = await http.get(Uri.parse(conn+"/fetchmenu/1"));
      var response = jsonDecode(res.body);
      return response;


    }catch(e){
      return null;
    }



  }


  FetchNotice(user) async{


    try{

      var res = await http.get(Uri.parse(conn+"/fetchNotice/${user}"));

      var response = jsonDecode(res.body);

      return response;

    }catch(e){

      return null;

    }





  }


}