import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/global/generaldata/templates.dart';
import '../../core/global/theme/app_colors/light_colors.dart';
import '../../core/services/cvmaker.dart';

class CvBrowser extends StatefulWidget {
  const CvBrowser({super.key});

  @override
  State<CvBrowser> createState() => _CvBrowserState();
}

class _CvBrowserState extends State<CvBrowser> {
  Color c1=LightThemeColors.purple;
  Color c2 = const Color.fromARGB(204, 142, 180, 220);
  late Color col1=c1;
  late Color col2=c1;
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
          width: _width * 0.12,
          child: Center(child: GestureDetector(onTap: () {
            if (_controller.page == 0) {
              setState(() {
                col1=c2;
              });
            }
            else {
              if(col1==c2){
                setState(() {
                  col1=c1;
                });
              }
              int index = _controller.page!.floor() - 1;
              if (index < 0) {
                index += templates.length;
              }
              _controller.animateToPage(
                  index % templates.length, duration: Duration(milliseconds: 500),
                  curve: Curves.linear);
              Provider.of<CVProvider>(context, listen: false)
                  .setTemplateId(templates[index]["id"]!);
            }
          },
              child: Transform.rotate(angle: pi / 2,
                  child: Icon(Icons.arrow_drop_down_sharp, size: 40,
                    color:col1,)))),
        ),
        Expanded(child: InteractiveViewer(
          child: Material(
            elevation: 8,
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Image.asset(_data[index]["path"]!,
                fit: BoxFit.fill,);
              },
            ),
          ),
        )),
        SizedBox(
          height: _height * 0.5,
          width: _width * 0.12,
          child: Center(child: GestureDetector(onTap: () {
            if (_controller.page == templates.length - 1) {
              print('zebi');
             col2=c2;
            }
            else{
              if(col2==c2){
                setState(() {
                  col2=c1;
                });
              }
            int index = _controller.page!.floor() + 1;

            _controller.animateToPage(
                index % templates.length, duration: Duration(milliseconds: 500),
                curve: Curves.linear);
                Provider.of<CVProvider>(context, listen: false)
                    .setTemplateId(templates[index]["id"]!);
            }
          },
              child: Transform.rotate(angle: pi / 2,
                  child: Icon(Icons.arrow_drop_up_sharp, size: 40,
                      color: col2)))),
        )

      ],
    );
  }
}
