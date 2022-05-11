import 'dart:convert';
import 'package:fooddeliveryapp/Api/utils.dart';
import 'package:http/http.dart' as http;


class Auth{

  RegisterUser(name,lname,email,phone,pass) async{

    var res = await http.post(Uri.parse(conn+"/reg"), body: jsonEncode({
      'name':name,
      'lname':lname,
      'email':email,
      'phone':phone,
      'password':pass
    }), headers: {"content-type":"application/json"});


    var response = res.body;

    if(response == "success"){

      return "reg";

    }else{

      return 'failed';
    }



  }

  LoginUser(email,password) async{

    var res = await http.post(Uri.parse(conn+"/login"), body: jsonEncode({
      "email":email,
      "password":password
    }), headers: {"content-type": "application/json"});

    var response = res.body;

    if(response == 'clear'){

      return "Logged";

    }else{

      return "Deny";
    }

  }



}