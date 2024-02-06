//inport
import 'package:flutter/material.dart';
//create a type of collection that contain a key as string and value a TextEditingController and an exapansionTile

abstract class InputControllers {

}
class PerInfoControllers  extends InputControllers{
 late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController city;
  late TextEditingController country;
  late TextEditingController postalCode;
  PerInfoControllers() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    city = TextEditingController();
    country = TextEditingController();
    postalCode = TextEditingController();
  }
}
class EducationControllers extends InputControllers{
  late TextEditingController institution;
  late TextEditingController degree;
  late TextEditingController description;
  late TextEditingController startYear;
  late TextEditingController endYear;
  EducationControllers() {
    institution = TextEditingController();
    degree = TextEditingController();
    description = TextEditingController();
    startYear = TextEditingController();
    endYear = TextEditingController();
  }
}
class ExperienceControllers extends InputControllers{
  late TextEditingController title;
  late TextEditingController company;
  late TextEditingController description;
   late TextEditingController startMonth;
  late TextEditingController startYear;
  late TextEditingController endMonth;
  late TextEditingController endYear;
  ExperienceControllers() {
    title = TextEditingController();
    company = TextEditingController();
    description = TextEditingController();
    startYear = TextEditingController();
    endYear = TextEditingController();
    startMonth = TextEditingController();
    endMonth = TextEditingController();
  }
}
class SkillsControllers extends InputControllers{
  late TextEditingController skill;
  late TextEditingController level;
  SkillsControllers() {
    skill = TextEditingController();
    level = TextEditingController();
  }
}
class LanguageControllers extends InputControllers{
  late TextEditingController language;
  late TextEditingController level;
  LanguageControllers() {
    language = TextEditingController();
    level = TextEditingController();
  }
}
class InterestControllers extends InputControllers{
  late TextEditingController interest;
  InterestControllers() {
    interest = TextEditingController();
  }
}
