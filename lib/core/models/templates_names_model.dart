class TemplatesNamesModel {
  TemplatesNamesModel({
    required this.names,
  });
  late final List<String> names;

  TemplatesNamesModel.fromJson(List<String>json){
    names = json;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['names'] = names;
    return data;
  }
}