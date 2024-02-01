import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/global/theme/app_colors/light_colors.dart';

Drawer drawer(BuildContext context){
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
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Navigate to Settings screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Browse Templates'),
          onTap: () {
            // Navigate to Browse Templates screen
          },
        ),
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
          onTap: () {
            Navigator.pushNamed(context, '/enterscreen');
          },
        ),
      ],
    ),
  );
}