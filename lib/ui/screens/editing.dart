import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
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
            SectionPersonalInfo(),

            const SizedBox(
              height: 20,
            ),
            SectionEducation(),
            const SizedBox(
              height: 20,
            ),
            SectionExperience(),
            const SizedBox(
              height: 20,
            ),
            SectionSkills(),
            const SizedBox(
              height: 20,
            ),
            SectionLanguages(),
            const SizedBox(
              height: 20,
            ),
            SectionInterests(),

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
                      //navigate to preview screen
                      Navigator.pushNamed(context, '/preview');
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
