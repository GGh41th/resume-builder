import 'dart:typed_data';

class TemplatesModel{
  TemplatesModel({required List<Map<String,dynamic>> templates}) : _templates = templates;
  late List<Map<String,dynamic>> _templates;
  List<Map<String,dynamic>> get templates => _templates;

}