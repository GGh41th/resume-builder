import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editing extends StatefulWidget {
  const Editing({super.key});

  @override
  State<Editing> createState() => _EditingState();
}

class _EditingState extends State<Editing> {
  @override
  @override
  Widget build(BuildContext context) {
    return CScreen(
      context,
      text: "back",
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          children: [
            SizedBox(
            height: 20,
          ),
            ExpansionTile(
              leading: Icon(
                Icons.person,
                color: LightThemeColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("Personal Information"),
              backgroundColor: LightThemeColors.semiWhite,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: textf("First Name"),
                      ),

                    Expanded(
                      child: textf("Last Name"),
                    ),
                  ],
                ),
                textf("Email"),
                textf("Phone"),
                textf("Address"),
                textf("City"),
                textf("Country"),
                textf("Postal Code"),
              ],


            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.school,
                color: LightThemeColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("Education"),
              backgroundColor: LightThemeColors.semiWhite,
              children: [
                textf("Degree"),
                textf("Institution"),
                textf("Start Date"),
                textf("End Date"),
                textf("Description"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.work,
                color: LightThemeColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("Experience"),
              backgroundColor: LightThemeColors.semiWhite,
              children: [
                textf("Title"),
                textf("Company"),
                textf("Start Date"),
                textf("End Date"),
                textf("Description"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.star,
                color: LightThemeColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("Skills"),
              backgroundColor: LightThemeColors.semiWhite,
              children: [
                textf("Skill"),
                textf("Level"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.people,
                color: LightThemeColors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("References"),
              backgroundColor: LightThemeColors.semiWhite,
              children: [
                textf("Name"),
                textf("Company"),
                textf("Email"),
                textf("Phone"),
              ],
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
  Padding textf(text)
  {
    return Padding(padding: EdgeInsets.only(top:2,right:10,left: 10,bottom: 8),
      child: TextFormField(

        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(
              vertical: 4, horizontal: 10),
          hintText: text,
          fillColor: LightThemeColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
