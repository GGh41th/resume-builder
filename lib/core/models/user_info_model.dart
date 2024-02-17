
class UserInfoModel {
  UserInfoModel({
    required this.email,
    required this.firstName,
    required this.lastName,
  });
  late final String email;
  late final String firstName;
  late final String lastName;

  UserInfoModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
