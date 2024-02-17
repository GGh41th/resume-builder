
class UserInfoModel {
  UserInfoModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });
  late final int id;
  late final String email;
  late final String firstName;
  late final String lastName;

  UserInfoModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
