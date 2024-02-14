import 'package:codecraft/core/models/sections.dart';

class CV {
  String templateId="";
  String title="";
  // List of section types
  List<SectionType> sections = [];
  PersonalInfo personalInfo = PersonalInfo();
  List<Language> languages = [];
  List<Education> educations = [];
  List<Experience> experiences = [];
  List<Skills> skills = [];
  List<Interests> interests = [];
  addLanguage(){
    languages.add(Language());
  }
  addEducation(){
    educations.add(Education());
  }
  addExperience(){
    experiences.add(Experience());
  }
  addSkill(){
    skills.add(Skills());
  }
  addInterest(){
    interests.add(Interests());
  }
  removeLanguage(int index){
    //if (languages.length > 1)
    if(languages.length > 1) {
      languages.removeAt(index);
    }

  }
  removeEducation(int index){
    if(educations.length > 1) {
      educations.removeAt(index);
    }
  }
  removeExperience(int index){
    if(experiences.length > 1) {
      experiences.removeAt(index);
    }
  }
  removeSkill(int index){
    if(skills.length > 1) {
      skills.removeAt(index);
    }
  }
  removeInterest(int index){
    if(interests.length > 1) {
      interests.removeAt(index);
    }
  }




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