class TemplatesNamesModel {
  TemplatesNamesModel({
    required this.names,
  });
  late final List<String> names;

  TemplatesNamesModel.fromJson(Map<String, dynamic> json){
    names = List<String>.from(json['names']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['names'] = names;
    return data;
  }
}