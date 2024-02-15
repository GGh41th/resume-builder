import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/global/theme/app_colors/light_colors.dart';

Drawer cDrawer(BuildContext context){
  return Drawer(
    backgroundColor: LightThemeColors.semiWhite,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(


          child: Center(child: Image(image: AssetImage('assets/logo.png'),)),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            // Navigate to Home screen
            Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Browse Templates'),
          onTap: () {
            Navigator.pushNamed(context, '/choose');
            // Navigate to Browse Templates screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            // Navigate to About screen

          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async{
            SharedPreferences pref=await SharedPreferences.getInstance();
            print(pref.getString('token'));
            pref.remove('token');

            Scaffold.of(context).closeDrawer();
            Navigator.pushNamed(context, '/enterscreen');
          },
        ),
      ],
    ),
  );
}