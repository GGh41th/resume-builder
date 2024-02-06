import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/models/cvdata.dart';
import 'package:codecraft/core/models/sections%20Controller.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/cvmaker.dart';
import '../wdigets/inputs.dart';

class Editing extends StatefulWidget {
  const Editing({super.key});

  @override
  State<Editing> createState() => _EditingState();
}

class _EditingState extends State<Editing> {
  @override
  @override
  Widget build(BuildContext context) {
    var pv=Provider.of<CVProvider>(context);
    var sectionData = pv.cv.sections;
    Map<SectionType,InputControllers> controllers = {
      SectionType.PersonalDetails: PerInfoControllers(),
      SectionType.Education: EducationControllers(),
      SectionType.Experience: ExperienceControllers(),
      SectionType.Skills: SkillsControllers(),
      SectionType.Languages: LanguageControllers(),
      SectionType.Interests: InterestControllers(),
    };
    Map<SectionType,ExpansionTile> sections = {
      SectionType.PersonalDetails: SectionPersonalInfo(controllers[SectionType.PersonalDetails] as PerInfoControllers),
      SectionType.Education: SectionEducation(controllers[SectionType.Education] as EducationControllers),
      SectionType.Experience: SectionExperience(controllers[SectionType.Experience] as ExperienceControllers),
      SectionType.Skills: SectionSkills(controllers[SectionType.Skills] as SkillsControllers),
      SectionType.Languages: SectionLanguages(controllers[SectionType.Languages] as LanguageControllers),
      SectionType.Interests: SectionInterests(controllers[SectionType.Interests] as InterestControllers),
    };
    final editingformKey = GlobalKey<FormState>();
    return CScreen(
      context,
      text: "back",
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          children: [
            const SizedBox(
            height: 20,
          ),
            Form(
              key: editingformKey,
              child: Column(
                children: sectionData.map((e) {
                  return Column(
                    children: [
                      sections[e] as ExpansionTile,
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ) ,

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
                    onPressed: (){
                      if(editingformKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/preview');
                      }
                    },
                    icon:const Text('Preview',style: TextStyle(fontSize: 20)),
                    label: const Icon(Icons.save_outlined,size: 30,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //custimised textfield

}
