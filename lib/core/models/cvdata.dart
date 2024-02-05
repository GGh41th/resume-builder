class CV {
  String templateId="";
  String title="";
  // List of section types
  List<SectionType> sections = [];
  Map<String, dynamic> sectionData = {};

// Add constructors, etc. as needed
}
enum SectionType {
  PersonalDetails,
  Languages,
  Education,
  Experience,
  Skills,
  Interests
}