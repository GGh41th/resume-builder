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
    final data = <String, dynamic>{};
    data['firstName'] = fName;
    data['lastName'] = lName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}