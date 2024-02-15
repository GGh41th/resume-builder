import 'dart:convert';

import 'package:codecraft/core/global/generaldata/config.dart';
import 'package:codecraft/core/models/login_request_model.dart';
import 'package:codecraft/core/models/signup_request_model.dart';
import 'package:http/http.dart' as http;

class APIService{

  static var client =http.Client();
  static Future<http.Response> logIn(LoginModel model) async {
    Map<String,String> requestHeaders={
      'Content-Type' : 'application/json'
    };
    var url =Uri.http(Config.apiUrl,Config.loginApi);

    var response = await client.post(url,headers: requestHeaders,body: jsonEncode(model.toJson()));

return response;    // if it returns true then we need to implement the shared preferences and store the cookie in the shared api cahce
  }

  static Future<http.Response> signUp(SignupModel model) async {
    Map<String,String> requestHeaders={
      'Content-Type' : 'application/json'
    };
    var url =Uri.http(Config.apiUrl,Config.signUpApi);

    var response = await client.post(url,headers: requestHeaders,body: jsonEncode(model.toJson()));
    return response;

    //in the signUp we dont need to manipulate the token we need only the reponse

  }


}