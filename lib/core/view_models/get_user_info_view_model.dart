import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/reponse_error_model.dart';
import '../models/user_info_model.dart';
import '../services/userinfoservices/get_user_info_api_service.dart';

class GetUserInfoViewModel{
  static Future<dynamic> getUserInfo() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token=pref.getString('token');
    var response = await ApiUserInfo.getUserInfo(token!);
    if(response.statusCode==200){
      return UserInfoModel.fromJson(jsonDecode(response.body));
    }
    else{
      return RErrorModel.fromJson(jsonDecode(response.body));
    }
  }
}

