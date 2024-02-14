import 'package:codecraft/core/models/sections%20Controller.dart';

class Section{


}
class PersonalInfo extends Section{
  PerInfoControllers controller;
  PersonalInfo()
  :controller = PerInfoControllers();
  String get firstName => controller.firstName.text;
  String get lastName => controller.lastName.text;
  String get email => controller.email.text;
  String get phone => controller.phone.text;
  String get address => controller.address.text;
  String get city => controller.city.text;
  String get country => controller.country.text;
  String get postalCode => controller.postalCode.text;
}
class Language extends Section{
  LanguageControllers controller;
  Language()
  :controller = LanguageControllers();
  String get language => controller.language.text;
  int get level => controller.level;
}
class Education extends Section{
  EducationControllers controller;
  Education()
  :controller = EducationControllers();
  String get institution => controller.institution.text;
  String get degree => controller.degree.text;
  String get description => controller.description.text;
  String get startYear => controller.startYear.text;
  String get endYear => controller.endYear.text;
}
class Experience extends Section{
  ExperienceControllers controller;
  Experience()
  :controller = ExperienceControllers();
  String get title => controller.title.text;
  String get company => controller.company.text;
  String get description => controller.description.text;
  String get startYear => controller.startYear.text;
  String get endYear => controller.endYear.text;
  String get startMonth => controller.startMonth.text;
  String get endMonth => controller.endMonth.text;
}
class Skills extends Section{
  SkillsControllers controller;
  Skills()
  :controller = SkillsControllers();
  String get skill => controller.skill.text;
  String get level => controller.level.text;
}
class Interests extends Section{
  InterestControllers controller;
  Interests()
  :controller = InterestControllers();
  String get interest => controller.interest.text;
}