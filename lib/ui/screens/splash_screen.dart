import 'dart:math';

import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    Future.delayed(const Duration(seconds: 2),() {
      Navigator.pushNamed(context, '/choose');
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
