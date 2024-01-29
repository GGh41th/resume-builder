import 'package:codecraft/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:codecraft/core/global/theme/theme_data/theme_data_light.dart';
import 'package:codecraft/ui/screens/enterscreen.dart';
import 'package:codecraft/ui/screens/home.dart';
import 'package:codecraft/ui/screens/login.dart';
import 'package:codecraft/ui/screens/signup.dart';
import 'package:codecraft/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/':(context) =>  SplashScreen(),
        '/enterscreen':(context) => EnterScreen(),
        '/signup':(context) => SignUp(),
        '/login':(context) => Login(),
        '/home':(context) => Home()



    },

    );
  }
}
