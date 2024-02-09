import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../core/global/theme/app_colors/light_colors.dart';
import '../../core/models/sections Controller.dart';

Padding textf(text,controller,{keyboardType =TextInputType.text,
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

ExpansionTile SectionPersonalInfo(PerInfoControllers controller) {

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
        textf("Phone",controller.phone,keyboardType: TextInputType.phone,
            maxLength: 9,
            validator: (value) {
              if (value.length != 9) {
                return 'Please enter a valid phone number';
              }
              return null;
            }),
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

ExpansionTile SectionEducation(EducationControllers controller) {
  return SectionInfos(Icons.school,"Education",
      [textf("Degree",controller.degree,keyboardType: TextInputType.text,maxLength: 20),
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
      ]);
}
ExpansionTile SectionExperience(ExperienceControllers controller) {
  return SectionInfos(Icons.work,"Experience",
      [textf("Title",controller.title,keyboardType: TextInputType.text,maxLength: 10),
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
                    //validate a reel year
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
      ]);
}
ExpansionTile SectionSkills(SkillsControllers controller) {
  return SectionInfos(Icons.star,"Skills",
      [textf("Skill",controller.skill,keyboardType: TextInputType.text,maxLength: 10),
        textf("Level",controller.level,keyboardType: TextInputType.text,maxLength: 10)
      ]);
}
ExpansionTile SectionLanguages(LanguageControllers controller) {
  return SectionInfos(Icons.language,"Languages",
      [textf("Language",controller.language,keyboardType: TextInputType.text,maxLength: 10),
        textf("Level",controller.level,keyboardType: TextInputType.text,maxLength: 10),
      ]);
}

ExpansionTile SectionInterests(InterestControllers controller){
  return SectionInfos(Icons.favorite,"Interests",
      [textf("Interest",controller.interest,keyboardType: TextInputType.text,maxLength: 10),
      ]);

}

ExpansionTile changeEmail(SettingsController controller) {
  return SectionInfos(Icons.email,'Change Email', [Column(
    children: [
      Text('here will appear the email called by the API'),
      textf('Enter ur new email',
          controller.email,
          validator:(value) {
            if (!EmailValidator.validate(value.trim())) {
              return 'Please enter a valid email';
            }
            return null;
          }
      )
    ],
  )]);
}


ExpansionTile changePassword(SettingsController controller) {
  return SectionInfos(Icons.password_sharp,'Change Password', [Column(
    children: [
      textf('Enter the new password', controller.password),
      textf('Confirm password', controller.confirmPassword)
    ],
  )]);
}



ExpansionTile changePicture({required void Function()? gallery,required void Function()? camera}) {
  return SectionInfos(Icons.account_circle,'Upload a new picture' ,[ Column(
    children: [
      ElevatedButton(onPressed: gallery, child: Text('Gallery Image')),
      ElevatedButton(onPressed: camera, child: Text('Take Picture'))
    ],
  )]);
}






