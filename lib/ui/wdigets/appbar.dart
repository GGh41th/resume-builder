import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context){
  return AppBar(
    title: const Image(image: AssetImage('assets/logoAllWhite.png'),
      height: 50,),
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