import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/reponse_error_model.dart';
import '../models/templates_names_model.dart';
import '../services/templates_services/get_names_api_service.dart';
import '../services/templates_services/get_png_api_service.dart';

class TemplatesViewModel {
  static Future<dynamic> getNames() async {
    var response = await ApiNames.getNames();
    if (response.statusCode == 200) {
      return TemplatesNamesModel.fromJson(jsonDecode(response.body));
    } else {
      return RErrorModel.fromJson(jsonDecode(response.body));
    }
  }

  static Future<void> fetchTemplates(List<String> names) async {
    await Hive.openBox('templateBox');
    for (var name in names) {
      var box = Hive.box('templateBox');
      if (!box.containsKey(name)) {
        var response = await ApiPng.getPng(name);
        if (response.statusCode == 200) {
          // Extract base64 string from the response body
          String base64String = response.body;

          // Decode base64 string into bytes
          Uint8List templatePng = base64Decode(base64String);

          // Store the decoded image bytes in the Hive box
          await box.put(name, templatePng);
        } else {
          var err = RErrorModel.fromJson(jsonDecode(response.body));
          // Handle error
        }
      }
    }
  }
}