class PngTemplateModel {
  String base64Image;

  PngTemplateModel({required this.base64Image});

  factory PngTemplateModel.fromBase64(String base64String) {
    return PngTemplateModel(base64Image: base64String);
  }
}