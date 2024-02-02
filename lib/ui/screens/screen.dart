import 'package:codecraft/ui/wdigets/appbar.dart';
import 'package:flutter/material.dart';

import '../../core/global/generaldata/assets_paths.dart';

Scaffold CScreen(BuildContext context,  {required Widget body,String text = "menu", double elevationAppBar = 4.0}) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height ;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: CAppBar(context, text: text, elev: elevationAppBar),
    body: Stack(
      children: [

        SizedBox(
          height: _height,
          width: _width,
          child: Expanded(
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
        ),
        SizedBox(
          height: _height,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              SizedBox(
                //height:  _height* 0.15,
                width: _width,
                child: const Image(
                  image: AssetImage(cercle),

                ),
              ),
            ],
          ),
        ),
      ],
    )
  );
}