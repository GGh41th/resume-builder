import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar CAppBar(BuildContext context){
  return AppBar(
    title: const Align(

      alignment: Alignment(0.8, 0),
      child: Image(image: AssetImage('assets/logoAllWhite.png'),
        height: 50,),
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
  );
}