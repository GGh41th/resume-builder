import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/global/theme/app_colors/light_colors.dart';

Padding textf(text,{keyboardType =TextInputType.text,
                    inputFormatter =null,
                    maxLenght =null,
                    validator=null}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2, right: 10, left: 10, bottom: 8),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        validator(value);
        return null;
      },
      keyboardType: keyboardType,
      inputFormatters: (inputFormatter!= null)?([inputFormatter]):[],
      maxLength: maxLenght,
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

ExpansionTile SectionIfos(icon,title,children) {
  return ExpansionTile(
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

ExpansionTile SectionPersonalInfo() {
  return SectionIfos(Icons.person,"Personal Info",
      [Row(
        children: [
          Expanded(
            child: textf("First Name"),
          ),

          Expanded(
            child: textf("Last Name"),
          ),
        ],
      ),
        textf("Email",keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            }),
        textf("Phone",keyboardType: TextInputType.phone,
            maxLenght: 9,
            inputFormatter: FilteringTextInputFormatter.digitsOnly,
            validator: (value) {
              if (value.length != 9) {
                return 'Please enter a valid phone number';
              }
              return null;
            }),
        textf("Address",keyboardType: TextInputType.streetAddress,maxLenght: 50),

        textf("City",keyboardType: TextInputType.streetAddress,maxLenght: 50),
        textf("Country",keyboardType: TextInputType.streetAddress,maxLenght: 50),
        textf("Postal Code",keyboardType: TextInputType.number,maxLenght: 4,
            inputFormatter: FilteringTextInputFormatter.digitsOnly,
            validator: (value) {
              if (value.length != 4) {
                return 'Please enter a valid postal code';
              }
              return null;
            }),
      ]);
}

ExpansionTile SectionEducation() {
  return SectionIfos(Icons.school,"Education",
      [textf("Degree"),
        textf("Institution"),
        Row(
          children: [
            Expanded(
              child: textf("Start Date",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    if(int.parse(value)>DateTime.now().year)
                      return 'Please enter a valid year';
                    return null;
                  }),
            ),
            Expanded(
              child: textf("End Date",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        textf("Description",keyboardType: TextInputType.multiline,maxLenght: 200),
      ]);
}
ExpansionTile SectionExperience() {
  return SectionIfos(Icons.work,"Experience",
      [textf("Title"),
        textf("Company"),
        Row(
          children: [
            Expanded(
              child: textf("Start year",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    //validate a reel year
                    if(int.parse(value)>DateTime.now().year)
                      return 'Please enter a valid year';
                    return null;
                  }),
            ),
            Expanded(
              child: textf("Start month",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 2,
                  validator: (value) {
                    if (value.length != 2) {
                      return 'Please enter a valid month';
                    }
                    if(int.parse(value)>12)
                      return 'Please enter a valid month';
                    return null;
                  }),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: textf("End year",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 4,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  }),
            ),
            Expanded(
              child: textf("End month",keyboardType: TextInputType.datetime,
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  maxLenght: 2,
                  validator: (value) {
                    if (value.length != 4) {
                      return 'Please enter a valid month';
                    }
                    if(int.parse(value)>12)
                      return 'Please enter a valid month';
                    return null;
                  }),
            ),
          ],
        ),
        textf("Description",keyboardType: TextInputType.multiline,maxLenght: 200),
      ]);
}
ExpansionTile SectionSkills() {
  return SectionIfos(Icons.star,"Skills",
      [textf("Skill"),
        textf("Level"),
      ]);
}
ExpansionTile SectionLanguages() {
  return SectionIfos(Icons.language,"Languages",
      [textf("Language"),
        textf("Level"),
      ]);
}

ExpansionTile SectionInterests(){
  return SectionIfos(Icons.favorite,"Interests",
      [textf("Interest"),
      ]);
}


