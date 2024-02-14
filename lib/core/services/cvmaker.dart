import 'package:flutter/material.dart';

import '../models/cvdata.dart';
import '../models/sections.dart';

// Define your CV data model


// Create a class to hold your application state
class CVProvider with ChangeNotifier {
  final CV _cv = CV();


  CV get cv => _cv;

  void setTemplateId(String templateId) {
    _cv.templateId = templateId;
    notifyListeners();
  }
// Implement similar methods for other data fields
 void setTitle(String title) {
    _cv.title = title;
    notifyListeners();
  }
  void setSections( List<SectionType> list) {

    _cv.sections = list;
    _cv.personalInfo = PersonalInfo();
    for(int i = 0; i < list.length; i++){
      if(list[i] == SectionType.Languages){
        _cv.languages.add(Language());
      }
      if(list[i] == SectionType.Education){
        _cv.educations.add(Education());
      }
      if(list[i] == SectionType.Experience){
        _cv.experiences.add(Experience());
      }
      if(list[i] == SectionType.Skills){
        _cv.skills.add(Skills());
      }
      if(list[i] == SectionType.Interests){
        _cv.interests.add(Interests());
      }
    }
    notifyListeners();
  }
  void addLanguage() {
    _cv.addLanguage();
    notifyListeners();
  }
  void removeLanguage(int index) {
    _cv.removeLanguage(index);
    notifyListeners();
  }

  void addInterest() {
    _cv.addInterest();
    notifyListeners();
  }
  void removeInterest(int index) {
    _cv.removeInterest(index);
    notifyListeners();
  }
  void addSkill() {
    _cv.addSkill();
    notifyListeners();
  }
  void removeSkill(int index) {
    _cv.removeSkill(index);
    notifyListeners();
  }
  void addExperience() {
    _cv.addExperience();
    notifyListeners();
  }
  void removeExperience(int index) {
    _cv.removeExperience(index);
    notifyListeners();
  }
  void addEducation() {
    _cv.addEducation();
    notifyListeners();
  }
  void removeEducation(int index) {
    _cv.removeEducation(index);
    notifyListeners();
  }



}


  // Other screens and API request methods would follow a similar pattern
