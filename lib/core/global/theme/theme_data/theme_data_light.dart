import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    scaffoldBackgroundColor: LightThemeColors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.blue,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        color: Colors.white

      ) ,
    ),


    );

}