import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/models/cvdata.dart';
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




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
      print(sectionData);
      print ("lan : ${pv.cv.languages.length}");
      print ("edu : ${pv.cv.educations.length}");
      print ("exp : ${pv.cv.experiences.length}");
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
                      children:sectionData
                          .map((e) {
                            ExpansionTile x;
                            if(e == SectionType.PersonalDetails) {
                          x = SectionPersonalInfo(context);
                        } else if(e == SectionType.Languages) {
                          x = SectionLanguages(context);
                        } else if(e == SectionType.Education) {
                          x = SectionEducation(context);
                        } else if(e == SectionType.Experience) {
                          x = SectionExperience(context);
                        } else if(e == SectionType.Skills) {
                          x = SectionSkills(context);
                        } else if(e == SectionType.Interests) {
                          x = SectionInterests(context);
                        } else {
                          x = SectionPersonalInfo(context);
                        }
                        return ListTile(
                                key: ValueKey(e),
                                title: x,
                              );
                          })
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 70,),

              ],
            ),
            Align(
              alignment:const FractionalOffset(1,0.85),
              child: TextButton.icon(
                style: TextButton.styleFrom(

                  backgroundColor: LightThemeColors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: (){
                  if(editingformKey.currentState!.validate()) {
                    //Navigator.pushNamed(context, '/preview');
                  }
                },
                icon:const Text('Preview',style: TextStyle(fontSize: 20)),
                label: const Icon(Icons.save_outlined,size: 30,),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * 0.1,
                width: width,
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
