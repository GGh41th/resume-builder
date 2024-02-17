import 'dart:convert';

import 'package:codecraft/core/global/generaldata/config.dart';
import 'package:codecraft/core/models/templates_names_model.dart';
import 'package:http/http.dart' as http;

import '../../models/reponse_error_model.dart';

class ApiNames {
  static var client = http.Client();
  static Future<http.Response> getNamesApi() async {
    var url = Uri.http(Config.apiUrl, Config.templateNames);
    http.Response response = await client.get(url);
    return response;
  }
}

