import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/material.dart';

import '../../core/global/generaldata/assets_paths.dart';
import '../wdigets/appbar.dart';
import 'editing.dart';

class Sections extends StatefulWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  Map<String, dynamic> sectionStates = {
    'Personal Details': {"icon": Icons.person, "value": false},
    'Languages': {"icon": Icons.language, "value": false},
    'Education': {"icon": Icons.school, "value": false},
    'Experience': {"icon": Icons.work, "value": false},
    'Skills': {"icon": Icons.star, "value": false},
    'References': {"icon": Icons.people, "value": false},
    'Interests': {"icon": Icons.music_note, "value": false},
  };

  void _handleSectionToggle(String section, bool value) {
    setState(() {
      sectionStates[section]['value'] = value;
    });
  }

  void _handleSubmit() {
    // Handle submission logic using sectionStates
    print(sectionStates);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Editing()));
  }

  @override
  Widget build(BuildContext context) {
    return CScreen(context,
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
                  secondary: Icon(sectionStates[section]["icon"] as IconData,size:30 ,), // Replace with appropriate icons
                  title: Text(section,style: const TextStyle(fontSize: 20)),
                  thumbIcon: (sectionStates[section]["value"] )
                      ? MaterialStateProperty.all(const Icon(Icons.check,size: 20,))
                      : MaterialStateProperty.all(const Icon(Icons.close,size: 20,)),
                  value: sectionStates[section]["value"] ,
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
