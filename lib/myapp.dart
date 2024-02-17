import 'package:codecraft/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:codecraft/core/global/theme/theme_data/theme_data_light.dart';
import 'package:codecraft/core/view_models/cvmaker.dart';
import 'package:codecraft/ui/screens/Sections.dart';
import 'package:codecraft/ui/screens/choose_template.dart';
import 'package:codecraft/ui/screens/editing.dart';
import 'package:codecraft/ui/screens/enterscreen.dart';
import 'package:codecraft/ui/screens/home.dart';
import 'package:codecraft/ui/screens/login.dart';
import 'package:codecraft/ui/screens/pdfviewer.dart';
import 'package:codecraft/ui/screens/profile.dart';
import 'package:codecraft/ui/screens/settings.dart';
import 'package:codecraft/ui/screens/signup.dart';
import 'package:codecraft/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CVProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: {
          '/':(context) =>  SplashScreen(),
          '/enterscreen':(context) => EnterScreen(),
          '/home':(context) => Home(),
          '/choose':(context) => ChooseScreen(),
          '/sections':(context) => Sections(),
          '/profile':(context) => Profile(),
          '/editing':(context) => Editing(),
          '/preview':(context) => PDFScreen(),
          '/settings':(context) => Settings()


      },

      ),
    );
  }
}
