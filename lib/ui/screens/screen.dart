import 'package:codecraft/ui/wdigets/appbar.dart';
import 'package:flutter/material.dart';

import '../../core/global/generaldata/assets_paths.dart';
import '../wdigets/drawer.dart';

Scaffold cScreen(BuildContext context,  {required Widget body,String text = "menu", double elevationAppBar = 4.0}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height ;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: cAppBar(context, text: text, elev: elevationAppBar),
    drawer: cDrawer(context),
    body: Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Container(
             padding: MediaQuery.of(context).viewInsets,
            width: width,
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
            height:  height* 0.1,
            width: width,
            child: const FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: AssetImage(circles),

              ),
            ),
          ),
        ),
      ],
    )
  );
}