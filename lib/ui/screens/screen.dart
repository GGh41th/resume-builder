import 'package:codecraft/ui/wdigets/appbar.dart';
import 'package:flutter/material.dart';

import '../../core/global/generaldata/assets_paths.dart';
import '../wdigets/drawer.dart';

Scaffold CScreen(BuildContext context,  {required Widget body,String text = "menu", double elevationAppBar = 4.0}) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height ;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: CAppBar(context, text: text, elev: elevationAppBar),
    drawer: Cdrawer(context),
    body: Stack(
      children: [
        SizedBox(
          height: _height,
          width: _width,
          child: Container(
             padding: MediaQuery.of(context).viewInsets,
            width: _width,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      body,
                      const SizedBox(
                        height: 100,)
                    ],
                  ))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height:  _height* 0.1,
            width: _width,
            child: const FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: AssetImage(cercle),

              ),
            ),
          ),
        ),
      ],
    )
  );
}