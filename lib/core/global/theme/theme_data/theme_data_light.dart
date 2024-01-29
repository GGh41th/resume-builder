import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    scaffoldBackgroundColor: LightThemeColors.semiWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.purple,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        color: Colors.white

      ) ,
    ),


    );

}