class SignupModel {
  SignupModel({
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
  });
  late final String fName;
  late final String lName;
  late final String email;
  late final String password;

  SignupModel.fromJson(Map<String, dynamic> json){
    fName = json['fname'];
    lName = json['lname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = fName;
    _data['lastName'] = lName;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}