import 'dart:math';

import 'package:codecraft/core/view_models/templates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../core/global/theme/app_colors/light_colors.dart';
import '../../core/view_models/cvmaker.dart';


class CvBrowser extends StatefulWidget {
  const CvBrowser({super.key});

  @override
  State<CvBrowser> createState() => _CvBrowserState();
}

class _CvBrowserState extends State<CvBrowser> {
  Color c1 = LightThemeColors.purple;
  Color c2 = const Color.fromARGB(204, 142, 180, 220);
  late Color col1 = c1;
  late Color col2 = c1;
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return FutureBuilder(future: TemplatesViewModel.getTemplates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.data == null) {
            return Placeholder();
          }else{
          print(snapshot.data!.length);
          return Row(
            children: [
              SizedBox(
                height: height * 0.5,
                width: width * 0.12,
                child: Center(child: GestureDetector(onTap: () {
                  print(_controller.page);
                  if (_controller.page! == 0) {
                    return;
                  }
                  else {
                    if (col2 == c2) {
                      setState(() {
                        col2 = c1;
                      });
                    }
                    int index = _controller.page!.floor() - 1;
                    if (_controller.page == 1) {
                      setState(() {
                        col1 = c2;
                      });
                    }
                    _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                    Provider.of<CVProvider>(context, listen: false)
                     .setTemplateTitle(snapshot.data![index]["name"]!);

                  }
                },
                    child: Transform.rotate(angle: pi / 2,
                        child: Icon(Icons.arrow_drop_down_sharp, size: 40,
                          color: col1,)))),
              ),
              Expanded(child: InteractiveViewer(
                child: Material(
                  elevation: 8,
                  child: PageView.builder(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
print(index);
                      return Image.memory(snapshot.data![index]['data']!,
                        fit: BoxFit.fill,);
                    },
                  ),
                ),
              )),
              SizedBox(
                height: height * 0.5,
                width: width * 0.12,
                child: Center(child: GestureDetector(onTap: () {
                  if (_controller.page! == snapshot.data!.length - 1) {
                    return;
                  }
                  else {
                    if (col1 == c2) {
                      setState(() {
                        col1 = c1;
                      });
                    }
                    int index = _controller.page!.floor() + 1;
                    if (_controller.page == snapshot.data!.length - 2) {
                      setState(() {
                        col2 = c2;
                      });
                    }
                    _controller.animateToPage(
                        index ,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                     Provider.of<CVProvider>(context, listen: false)


                  .setTemplateTitle(snapshot.data![index]["name"]!);
                  }
                },
                    child: Transform.rotate(angle: pi / 2,
                        child: Icon(Icons.arrow_drop_up_sharp, size: 40,
                            color: col2)))),
              )
            ],
          );}
        });
  }
}
