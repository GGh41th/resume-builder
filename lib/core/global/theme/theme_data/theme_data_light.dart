import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    scaffoldBackgroundColor: LightThemeColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.purple,
      elevation: 10,
      shadowColor: LightThemeColors.purple,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      toolbarHeight: 80,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 35
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        color: Colors.white

      ) ,
    ),


    );

}