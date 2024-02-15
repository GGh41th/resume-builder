import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/models/cvdata.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/cvmaker.dart';
import 'editing.dart';

class Sections extends StatefulWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  Map<SectionType, Map<String,dynamic>> sectionStates = {
    SectionType.personalDetails: {"icon": Icons.person, "value": true,"text":"Personal Details"},
    SectionType.languages: {"icon": Icons.language, "value": false,"text":"Languages"},
    SectionType.education: {"icon": Icons.school, "value": false,"text":"Education"},
    SectionType.experience: {"icon": Icons.work, "value": false,"text":"Experience"},
    SectionType.skills: {"icon": Icons.star, "value": false,"text":"Skills"},
    SectionType.interests: {"icon": Icons.people, "value": false,"text":"Interests"},
  };

  void _handleSectionToggle(SectionType section, bool value) {
    if(sectionStates[section]?["text"] != 'Personal Details')
    {
      setState(() {
        sectionStates[section]?['value'] = value;
      });
    }
  }

  void _handleSubmit() {
    //get keys section where value is true
    var selectedSections = sectionStates.keys.where((key) => sectionStates[key]!['value'] == true).toList();
    Provider.of<CVProvider>(context, listen: false).setSections(selectedSections);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Editing()));
  }

  @override
  Widget build(BuildContext context) {
    return cScreen(context,
      text: "back" ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              "Select the sections you want to include in your CV:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: sectionStates.keys.map((section) {
                return SwitchListTile(
                  secondary: Icon(sectionStates[section]?["icon"] as IconData,size:30 ,), // Replace with appropriate icons
                  title: Text(sectionStates[section]?["text"],style: const TextStyle(fontSize: 20)),
                  thumbIcon: (sectionStates[section]?["value"] )
                      ? MaterialStateProperty.all(const Icon(Icons.check,size: 20,))
                      : MaterialStateProperty.all(const Icon(Icons.close,size: 20,)),
                  value: sectionStates[section]?["value"] ,
                  onChanged: (bool value) {
                    _handleSectionToggle(section, value);
                  },

                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //start from the end
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                //text+icon button
                TextButton.icon(
                  style: TextButton.styleFrom(

                    backgroundColor: LightThemeColors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onPressed: _handleSubmit,
                  icon:const Text('NEXT'),
                  label: const Icon(Icons.navigate_next_sharp),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
