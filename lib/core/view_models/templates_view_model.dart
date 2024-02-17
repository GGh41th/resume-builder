import 'dart:convert';
import 'dart:typed_data';

import 'package:codecraft/core/models/templates_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/reponse_error_model.dart';
import '../models/templates_names_model.dart';
import '../services/templates_services/get_names_api_service.dart';
import '../services/templates_services/get_png_api_service.dart';

class TemplatesViewModel {
  static Future<dynamic> getNames() async {
    var response = await ApiNames.getNamesApi();
    if (response.statusCode == 200) {
      var decodedBody=jsonDecode(response.body);
      List<String> names = decodedBody.cast<String>();
      return TemplatesNamesModel.fromJson(names);
    } else {
      return RErrorModel.fromJson(jsonDecode(response.body));
    }
  }

  static Future<void> fetchTemplates(List<String> names,Box<dynamic> box) async {
    for (var name in names) {
      if (!box.containsKey(name)) {
        var response = await ApiPng.getPng(name);
        if (response.statusCode == 200) {
          Uint8List templatePng = response.bodyBytes;
          await box.put(name, templatePng);
        } else {
          var err = RErrorModel.fromJson(jsonDecode(response.body));
          // Handle error
        }
      }
    }
  }
  static Future<List<Map<String,dynamic>>> getTemplates() async {
    dynamic res = await getNames();
    if (res is RErrorModel) {
      throw Exception('Error Fetching names');
    } else {
      var box = Hive.box('templateBox');
      fetchTemplates(res.names,box);
      // Access the existing box without reopening
      List<Map<String,dynamic>> temp = [];
      Map<dynamic,dynamic> m=box.toMap();
      m.forEach((key, value) {
        temp.add({
          'name': key,
          'data': value,
        });
      });
      return TemplatesModel(templates: temp).templates;
    }
  }
    
  }
