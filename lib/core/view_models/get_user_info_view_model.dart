import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/reponse_error_model.dart';
import '../models/user_info_model.dart';
import '../services/userinfoservices/get_user_info_api_service.dart';

class GetUserInfoViewModel{


  static Future<dynamic> getUserInfoApi() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token=pref.getString('token');
    var response = await ApiUserInfo.getUserInfo(token!);
    if(response.statusCode==200){
      print(response.body);
      UserInfoModel success= UserInfoModel.fromJson(jsonDecode(response.body));
      var box= await Hive.openBox('UserInfo');
      box.put('firstName', success.firstName);
      box.put('email', success.email);
      box.put('lastName', success.lastName);
      return box;
    }
    else{
      print(response.body);
      RErrorModel err= RErrorModel.fromJson(jsonDecode(response.body));
      return Text(err.message);

    }
  }

  static Future<dynamic> getUserInfo() async {
    var box= await Hive.openBox('UserInfo');
    if(box.isNotEmpty){
      return box;
    }
    else{
      return getUserInfoApi();
    }
  }

}

