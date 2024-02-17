import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../core/global/theme/app_colors/light_colors.dart';
import '../../core/models/sections Controller.dart';
import '../../core/view_models/cvmaker.dart';

Padding textf(String text,TextEditingController controller,{keyboardType =TextInputType.text,
                    maxLength,
                    validator}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2, right: 10, left: 10, bottom: 8),
    child: TextFormField(

      autocorrect: false,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        validator(value);
        return null;
      },
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric( horizontal: 10,vertical: 10),
        hintText: text,
        counterText: "",
        fillColor: LightThemeColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

ExpansionTile SectionInfos(IconData icon,title,children) {
  return ExpansionTile(
    maintainState: true,
    leading: Icon(
      icon,
      color: LightThemeColors.black,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: Text(title,
      style: TextStyle(
        color: LightThemeColors.black,
         fontSize: 20,
      ),
    ) ,
    backgroundColor: LightThemeColors.semiWhite,
    children:children,
  );
}

ExpansionTile SectionPersonalInfo(BuildContext context,{key}) {
  var pv = Provider.of<CVProvider>(context);
  var controller = pv.cv.personalInfo.controller;
  return SectionInfos(Icons.person,"Personal Info",
      [Row(
        children: [
          Expanded(
            child: textf("First Name",controller.firstName),
          ),

          Expanded(
            child: textf("Last Name",controller.lastName),
          ),
        ],
      ),
        textf("Email",controller.email,keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!EmailValidator.validate(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            }),
        Padding(
          padding: const  EdgeInsets.only(top: 2, right: 10, left: 10, bottom: 8),
          child: IntlPhoneField(controller: controller.phone,decoration:  InputDecoration(
            contentPadding: const EdgeInsets.symmetric( horizontal: 10,vertical: 10),
            hintText: 'Phone Number',
            counterText: "",
            fillColor: LightThemeColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),),
        ),
        textf("Address",controller.address,keyboardType: TextInputType.streetAddress,maxLength: 50),

        textf("City",controller.city,keyboardType: TextInputType.streetAddress,maxLength: 50),
        textf("Country",controller.country,keyboardType: TextInputType.streetAddress,maxLength: 50),
        textf("Postal Code",controller.postalCode,keyboardType: TextInputType.number,maxLength: 4,

            validator: (value) {
              if (value.length != 4) {
                return 'Please enter a valid postal code';
              }
              return null;
            }),
      ]);
}

ExpansionTile SectionEducation(BuildContext context,{key}) {
  var pv = Provider.of<CVProvider>(context);
  var list = pv.cv.educations;
  //return a column with listbuilder
  return SectionInfos(Icons.school,"Education",
  list.map((e) {
    var controller = e.controller;
    return Column(
      children: [
        const SizedBox(height: 10,),
        textf("Degree",controller.degree,keyboardType: TextInputType.text,maxLength: 20),
        textf("Institution",controller.institution,keyboardType: TextInputType.text,maxLength: 20),
        Row(
          children: [
            Expanded(
              child: textf("Start Date",controller.startYear,keyboardType: TextInputType.datetime,
                  maxLength: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    if(int.parse(value)>DateTime.now().year) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  }),
            ),
            Expanded(
              child: textf("End Date",controller.endYear,keyboardType: TextInputType.datetime,
                  maxLength: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        textf("Description",controller.description,keyboardType: TextInputType.multiline,maxLength: 200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (list.length>1)?IconButton(
              onPressed: () {
                pv.removeEducation(pv.cv.educations.indexOf(e));
              },
              icon: const Icon(Icons.delete),
            ):Container(),
            IconButton(
              onPressed: () {
                pv.addEducation();
              },
              icon: const Icon(Icons.add,),
            ),
            //a line

          ],
        ),
        (list.indexOf(e)!=list.length-1 )?Divider(
          color: LightThemeColors.purple,
          thickness: 2,
        ):Container(),
      ],
    );
  }).toList());

}
ExpansionTile SectionExperience(BuildContext context,{key}) {
  var pv = Provider.of<CVProvider>(context);
  var list = pv.cv.experiences;
  //return a column with listbuilder
  return SectionInfos(Icons.work,"Experience",
      list.map((e) {
        var controller = e.controller;
        return Column(
          children: [
            const SizedBox(height: 10,),
            textf("Title",controller.title,keyboardType: TextInputType.text,maxLength: 10),
            textf("Company",controller.company,keyboardType: TextInputType.text,maxLength: 20),
            Row(
              children: [
                Expanded(
                  child: textf("Start year",controller.startYear,keyboardType: TextInputType.datetime,
                      maxLength: 4,
                      validator: (value) {
                        if (value.length != 4) {
                          return 'Please enter a valid year';
                        }
                        if(int.parse(value)>DateTime.now().year) {
                          return 'Please enter a valid year';
                        }
                        return null;
                      }),
                ),
                Expanded(
                  child: textf("Start month",controller.startMonth,keyboardType: TextInputType.datetime,
                      maxLength: 2,
                      validator: (value) {
                        if (value.length != 2) {
                          return 'Please enter a valid month';
                        }
                        if(int.parse(value)>12) {
                          return 'Please enter a valid month';
                        }
                        return null;
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: textf("End year",controller.endYear,keyboardType: TextInputType.datetime,
                      maxLength: 4,
                      validator: (value) {
                        if (value.length != 4) {
                          return 'Please enter a valid year';
                        }
                        return null;
                      }),
                ),
                Expanded(
                  child: textf("End month",controller.endMonth,keyboardType: TextInputType.datetime,
                      maxLength: 2,
                      validator: (value) {
                        if (value.length != 4) {
                          return 'Please enter a valid month';
                        }
                        if(int.parse(value)>12) {
                          return 'Please enter a valid month';
                        }
                        return null;
                      }),
                ),
              ],
            ),
            textf("Description",controller.description,keyboardType: TextInputType.multiline,maxLength: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (list.length>1)?IconButton(
                  onPressed: () {
                    pv.removeExperience(pv.cv.experiences.indexOf(e));
                  },
                  icon: const Icon(Icons.delete),
                ):Container(),
                IconButton(
                  onPressed: () {
                    pv.addExperience();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            (list.indexOf(e)!=list.length-1 )?Divider(
              color: LightThemeColors.purple,
              thickness: 2,
            ):Container(),
          ],
        );
      }).toList());

}
ExpansionTile SectionSkills(BuildContext context,{key}) {
  var pv = Provider.of<CVProvider>(context);
  var list = pv.cv.skills;
  //return a column with listbuilder
  return SectionInfos(Icons.star,"Skills",
      list.map((e) {
        var controller = e.controller;
        return Column(
          children: [
            const SizedBox(height: 10,),
            textf("Skill",controller.skill,keyboardType: TextInputType.text,maxLength: 10),
            textf("Level",controller.level,keyboardType: TextInputType.text,maxLength: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (list.length>1)?IconButton(
                  onPressed: () {
                    pv.removeSkill(pv.cv.skills.indexOf(e));
                  },
                  icon: const Icon(Icons.delete),
                ):Container(),
                IconButton(
                  onPressed: () {
                    pv.addSkill();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            (list.indexOf(e)!=list.length-1 )?Divider(
              color: LightThemeColors.purple,
              thickness: 2,
            ):Container(),
          ],
        );
      }).toList());

}
ExpansionTile SectionLanguages(BuildContext context,{key}) {
  var pv = Provider.of<CVProvider>(context);
  var list = pv.cv.languages;
  //return a column with listbuilder
  return SectionInfos(Icons.language,"Languages",
      list.map((e) {
        var controller = e.controller;
        return Column(
          children: [
            const SizedBox(height: 10,),
            textf("Language",controller.language,keyboardType: TextInputType.text,maxLength: 10),
            Slider(
              value: controller.level.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (double value) {
                pv.cv.languages[pv.cv.languages.indexOf(e)].controller.level = value.toInt();
                pv.notifyListeners();
              },
              label: (controller.level==1)?"beginner":(controller.level==2)?"intermediate":(controller.level==3)?"good":(controller.level==4)?"expert":"native",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (list.length>1)?IconButton(
                  onPressed: () {
                    pv.removeLanguage(pv.cv.languages.indexOf(e));
                  },
                  icon: const Icon(Icons.delete),
                ):Container(),
                IconButton(
                  onPressed: () {
                    pv.addLanguage();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            (list.indexOf(e)!=list.length-1 )?Divider(
              color: LightThemeColors.purple,
              thickness: 2,
            ):Container(),
          ],
        );
      }).toList());

}

ExpansionTile SectionInterests(BuildContext context,{key}){
  var pv = Provider.of<CVProvider>(context);
  var list = pv.cv.interests;
  //return a column with listbuilder
  return SectionInfos(Icons.favorite,"Interests",
      list.map((e) {
        var controller = e.controller;
        return Column(
          children: [
            const SizedBox(height: 10,),
            textf("Interest",controller.interest,keyboardType: TextInputType.text,maxLength: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (list.length>1)?IconButton(
                  onPressed: () {
                    pv.removeInterest(pv.cv.interests.indexOf(e));
                  },
                  icon: const Icon(Icons.delete),
                ):Container(),
                IconButton(
                  onPressed: () {
                    pv.addInterest();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            (list.indexOf(e)!=list.length-1 )?Divider(
              color: LightThemeColors.purple,
              thickness: 2,
            ):Container(),
          ],
        );
      }).toList());
}

ExpansionTile changeEmail(SettingsController controller,GlobalKey<FormState> _formkeymail) {
  return SectionInfos(Icons.email,'Change Email', [Form(
    key: _formkeymail,
    child: Column(
      children: [
        const Text('here will appear the email called by the API'),
        textf('Enter ur new email',
            controller.email,
            validator:(value) {
              if (!EmailValidator.validate(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            }
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            //satrt from the right
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formkeymail.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              ),
            ],),
        ),
      ],
    ),
  )]);
}
ExpansionTile changePassword(SettingsController controller,GlobalKey<FormState> _formkeypass) {
  return SectionInfos(Icons.password_sharp,'Change Password', [
    Form(
      key: _formkeypass,
      child: Column(
      children: [
        textf('Enter the new password', controller.password),
        textf('Confirm password', controller.confirmPassword),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            //satrt from the right
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formkeypass.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              ),
                ],
          ),
        ),
    ]),)]);
}



ExpansionTile changePicture({required void Function()? gallery,required void Function()? camera}) {
  return SectionInfos(Icons.account_circle,'Upload a new picture' ,[ Column(
    children: [
      ElevatedButton(onPressed: gallery, child: const Text('Gallery Image')),
      ElevatedButton(onPressed: camera, child: const Text('Take Picture'))
    ],
  )]);
}






