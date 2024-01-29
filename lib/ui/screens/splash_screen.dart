import 'dart:math';

import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    Future.delayed(const Duration(seconds: 5),() {
      Navigator.pushNamed(context, '/enterscreen');
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(pi/3),
              colors: [Colors.blue,Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
        ),
        child:  Center(
          child: Column(
            children: [
              Image.asset(logo1),
            ],
          ),
        ),
      ),
    );
  }


}
