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

ExpansionTile SectionInfos(icon,title,children) {
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

ExpansionTile SectionPersonalInfo(PerInfoControllers controler) {

  return SectionInfos(Icons.person,"Personal Info",
      [Row(
        children: [
          Expanded(
            child: textf("First Name",controler.firstName),
          ),

          Expanded(
            child: textf("Last Name",controler.lastName),
          ),
        ],
      ),
        textf("Email",controler.email,keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            }),
        textf("Phone",controler.phone,keyboardType: TextInputType.phone,
            maxLength: 9,
            validator: (value) {
              if (value.length != 9) {
                return 'Please enter a valid phone number';
              }
              return null;
            }),
        textf("Address",controler.address,keyboardType: TextInputType.streetAddress,maxLength: 50),

        textf("City",controler.city,keyboardType: TextInputType.streetAddress,maxLength: 50),
        textf("Country",controler.country,keyboardType: TextInputType.streetAddress,maxLength: 50),
        textf("Postal Code",controler.postalCode,keyboardType: TextInputType.number,maxLength: 4,

            validator: (value) {
              if (value.length != 4) {
                return 'Please enter a valid postal code';
              }
              return null;
            }),
      ]);
}

ExpansionTile SectionEducation(EducationControllers controler) {
  return SectionInfos(Icons.school,"Education",
      [textf("Degree",controler.degree,keyboardType: TextInputType.text,maxLength: 20),
        textf("Institution",controler.institution,keyboardType: TextInputType.text,maxLength: 20),
        Row(
          children: [
            Expanded(
              child: textf("Start Date",controler.startYear,keyboardType: TextInputType.datetime,
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
              child: textf("End Date",controler.endYear,keyboardType: TextInputType.datetime,
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
        textf("Description",controler.description,keyboardType: TextInputType.multiline,maxLength: 200),
      ]);
}
ExpansionTile SectionExperience(ExperienceControllers controler) {
  return SectionInfos(Icons.work,"Experience",
      [textf("Title",controler.title,keyboardType: TextInputType.text,maxLength: 10),
        textf("Company",controler.company,keyboardType: TextInputType.text,maxLength: 20),
        Row(
          children: [
            Expanded(
              child: textf("Start year",controler.startYear,keyboardType: TextInputType.datetime,
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
              child: textf("Start month",controler.startMonth,keyboardType: TextInputType.datetime,
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
              child: textf("End year",controler.endYear,keyboardType: TextInputType.datetime,
                  maxLength: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  }),
            ),
            Expanded(
              child: textf("End month",controler.endMonth,keyboardType: TextInputType.datetime,
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
        textf("Description",controler.description,keyboardType: TextInputType.multiline,maxLength: 200),
      ]);
}
ExpansionTile SectionSkills(SkillsControllers controler) {
  return SectionInfos(Icons.star,"Skills",
      [textf("Skill",controler.skill,keyboardType: TextInputType.text,maxLength: 10),
        textf("Level",controler.level,keyboardType: TextInputType.text,maxLength: 10)
      ]);
}
ExpansionTile SectionLanguages(LanguageControllers controler) {
  return SectionInfos(Icons.language,"Languages",
      [textf("Language",controler.language,keyboardType: TextInputType.text,maxLength: 10),
        textf("Level",controler.level,keyboardType: TextInputType.text,maxLength: 10),
      ]);
}

ExpansionTile SectionInterests(InterestControllers controler){
  return SectionInfos(Icons.favorite,"Interests",
      [textf("Interest",controler.interest,keyboardType: TextInputType.text,maxLength: 10),
      ]);

}


