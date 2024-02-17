import 'package:codecraft/core/global/generaldata/config.dart';
import 'package:http/http.dart' as http;
class ApiUserInfo{
  static var client =http.Client();
  static Future<http.Response> getUserInfo(String token) async {
    Map<String,String> requestHeaders={
      'Authorization': token
    };
    var url =Uri.http(Config.apiUrl,Config.userInfo);
    http.Response response = await client.get(url,headers: requestHeaders);
    return response;
  }
}