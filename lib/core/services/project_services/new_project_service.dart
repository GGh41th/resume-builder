import 'dart:convert';

import 'package:codecraft/core/models/new_project_request.dart';
import 'package:codecraft/core/models/new_project_response.dart';
import 'package:http/http.dart' as http;

import '../../global/generaldata/config.dart';

class NewProjectService {
  static var client =http.Client();
  static Future<NewProjectResponseModel> newProject(NewProjectRequestModel model) async {
    Map<String,String> requestHeaders={
      'Content-Type' : 'application/json'
    };
    var url =Uri.http(Config.apiUrl,Config.newProject);

    NewProjectResponseModel response = (await client.post(url,headers: requestHeaders,body: jsonEncode(model.toJson()))) as NewProjectResponseModel;

    return response;
  }
}

