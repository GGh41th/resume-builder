import 'package:http/http.dart' as http;

import '../../global/generaldata/config.dart';

class ApiPng {
  static var client = http.Client();
  static Future<http.Response> getPng(String name) async {
    var url = Uri.http(Config.apiUrl, Config.templatesPng+name);
    http.Response response = await client.get(url);
    return response;
  }
}
