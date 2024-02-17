class NewProjectResponseModel {
  late final String message;
  late final Project project;

  NewProjectResponseModel({required this.message,required this.project});

  NewProjectResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    project =
    (json['project'] != null ? new Project.fromJson(json['project']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  late final String id;
  late final String title;
  late final int creationDate;
  late final String templateName;

  Project({required this.id,required this.title,required this.creationDate,required this.templateName});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creationDate = json['creationDate'];
    templateName = json['templateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['creationDate'] = this.creationDate;
    data['templateName'] = this.templateName;
    return data;
  }
}