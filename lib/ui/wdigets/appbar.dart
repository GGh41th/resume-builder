import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar CAppBar(BuildContext context,{double elev=4.0,String text ="menu"}){
  return AppBar(
    toolbarHeight: 80,
    elevation: elev,
    title: const Align(
      alignment: Alignment(0.8, 0),
      child: Image(image: AssetImage('assets/logoAllWhite.png'),
        height: 50,),
    ),
    leading:
    Builder(
      builder: (BuildContext context) {
        switch(text){
          case "menu":
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          case "back":
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          default:
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
        }

      },
    ),
  );
}