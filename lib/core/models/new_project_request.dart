class NewProjectRequestModel {
  late final String title;
  late final String templateName;

  NewProjectRequestModel({required this.title, required this.templateName});

  NewProjectRequestModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    templateName = json['templateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['templateName'] = this.templateName;
    return data;
  }
}
