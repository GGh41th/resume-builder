import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/models/cvdata.dart';
import 'package:codecraft/core/models/sections%20Controller.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/cvmaker.dart';
import '../wdigets/appbar.dart';
import '../wdigets/drawer.dart';
import '../wdigets/inputs.dart';

class Editing extends StatefulWidget {
  const Editing({super.key});

  @override
  State<Editing> createState() => _EditingState();
}

class _EditingState extends State<Editing> {
  final editingformKey = GlobalKey<FormState>();
  late final Map<SectionType, InputControllers> controllers;
  late final Map<SectionType, ExpansionTile> sections;

  @override
  void initState() {
    super.initState();
    controllers = {
      SectionType.PersonalDetails: PerInfoControllers(),
      SectionType.Education: EducationControllers(),
      SectionType.Experience: ExperienceControllers(),
      SectionType.Skills: SkillsControllers(),
      SectionType.Languages: LanguageControllers(),
      SectionType.Interests: InterestControllers(),
    };
    sections = {
      SectionType.PersonalDetails: SectionPersonalInfo(
          controllers[SectionType.PersonalDetails] as PerInfoControllers),
      SectionType.Education: SectionEducation(
        controllers[SectionType.Education] as EducationControllers,
      ),
      SectionType.Experience: SectionExperience(
        controllers[SectionType.Experience] as ExperienceControllers,
      ),
      SectionType.Skills: SectionSkills(
        controllers[SectionType.Skills] as SkillsControllers,
      ),
      SectionType.Languages: SectionLanguages(
        controllers[SectionType.Languages] as LanguageControllers,
      ),
      SectionType.Interests: SectionInterests(
        controllers[SectionType.Interests] as InterestControllers,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var pv = Provider.of<CVProvider>(context);
    var sectionData = pv.cv.sections;
    void updateOrder(int oldIndex, int newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex--;
        }
        final element = sectionData.removeAt(oldIndex);
        sectionData.insert(newIndex, element);
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CAppBar(context, text: "back", elev: 4),
        drawer: Cdrawer(context),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: editingformKey,
                  child: Expanded(
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) =>
                          updateOrder(oldIndex, newIndex),
                      children: sectionData
                          .map((e) => ListTile(
                                key: ValueKey(e),
                                title: sections[e],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      if (editingformKey.currentState!.validate()) {
                      }
                    },
                    child: Row(
                      children: [Icon(Icons.save), Text('Preview')],
                    ))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _height * 0.1,
                width: _width,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Image(
                    image: AssetImage(cercle),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
//custimised textfield
}
