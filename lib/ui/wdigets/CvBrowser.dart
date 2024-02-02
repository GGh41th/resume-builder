import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/global/generaldata/templates.dart';
import '../../core/global/theme/app_colors/light_colors.dart';

class CvBrowser extends StatefulWidget {
  const CvBrowser({super.key});

  @override
  State<CvBrowser> createState() => _CvBrowserState();
}

class _CvBrowserState extends State<CvBrowser> {
  List<Map<String, String>>_data = templates;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    return Row(
      children: [
        SizedBox(
          height: _height * 0.5,
          width: _width * 0.1,
          child: Center(child: GestureDetector(onTap: () {
            if (_controller.page == 0) {
              _controller.animateToPage(
                  templates.length - 1, duration: Duration(seconds: 1),
                  curve: Curves.linear);
            }
            else {
              int index = _controller.page!.floor() - 1;
              if (index < 0) {
                index += templates.length;
              }
              _controller.animateToPage(
                  index % templates.length, duration: Duration(seconds: 1),
                  curve: Curves.linear);
            }
          },
              child: Transform.rotate(angle: pi / 2,
                  child: Icon(Icons.arrow_drop_down_sharp, size: 40,
                    color: LightThemeColors.purple,)))),
        ),
        Expanded(child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: _height * 0.04),
              child: Image.asset(_data[index]["path"]!),
            );
          },
        )),
        SizedBox(
          height: _height * 0.5,
          width: _width * 0.1,
          child: Center(child: GestureDetector(onTap: () {
            if (_controller.page == templates.length - 1) {
              _controller.animateToPage(
                  0, duration: Duration(seconds: 1), curve: Curves.linear);

            }
            else{
            int index = _controller.page!.floor() + 1;

            _controller.animateToPage(
                index % templates.length, duration: Duration(seconds: 1),
                curve: Curves.linear);}
          },
              child: Transform.rotate(angle: pi / 2,
                  child: Icon(Icons.arrow_drop_up_sharp, size: 40,
                      color: LightThemeColors.purple)))),
        )

      ],
    );
  }
}
