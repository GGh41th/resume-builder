
class RSuccessModel {
  RSuccessModel({
    required this.token,
  });
  late final String token;

  RSuccessModel.fromJson(Map<String, dynamic> json){
    token = json['Authorization'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Authorization'] = token;
    return _data;
  }
}