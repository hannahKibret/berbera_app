import 'dart:convert';
import 'dart:io';

import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/models/User.dart';
import 'package:berbera_app/models/item.dart';
import 'package:berbera_app/models/login_model.dart';
import 'package:dio/dio.dart';

class APIService{

Future<bool> createUser(User user) async{
  var authToken = base64.encode(utf8.encode(Config.key+":"+Config.screte),
  );

  bool ret= false;
  try{
    var response = await Dio().post(
      Config.wp_URL + Config.userURL,
      data: user.toJson(),
      options: new Options(
        headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: "application/json"
        }));
    if(response.statusCode == 201){
      ret = true;
    }
  } on DioError catch (e){
    if(e.response.statusCode == 404){
      ret = false;
    }else{
      ret = false;
    }

  }

  return ret;

}

Future<Item> getproducts(){

}

  Future<LoginResponseModel> loginUser(String username, String password) async{

    try{
      var response = await Dio().post(
        Config.tokenURL, data:{
          "username" : username,
          "password" : password,
      },
        options: new Options(
          headers:{
            HttpHeaders.contentTypeHeader: "application/x-www-from-urlencoded",
          }
        )
      );

      if(response.statusCode == 200){
        LoginResponseModel user = new LoginResponseModel();
        User user_data = User.fromJson(response.data);
       // print(user_data.token);
        user.data = user_data;
        user.statusCode = response.statusCode;
        return user;
      }
    }on DioError catch (e){
      print(e.message);
      return null;
    }

  }
}