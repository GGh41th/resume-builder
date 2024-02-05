import 'dart:math';

import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/global/theme/app_colors/light_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2),() async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      String? token=pref.getString('token');
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh    $token');
      (token==null) ? Navigator.pushNamedAndRemoveUntil(context, '/enterscreen',(route) => false,):Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    },);


  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(pi/3),
              colors: [LightThemeColors.purple,LightThemeColors.semiWhite],

              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          )
        ),
        child:  Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }


}
