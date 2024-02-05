import 'package:flutter/material.dart';

import '../models/cvdata.dart';

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
    notifyListeners();
  }
  void setSectionData(Map<String, dynamic> sectionData) {
    _cv.sectionData = sectionData;
    notifyListeners();
  }

}


  // Other screens and API request methods would follow a similar pattern
