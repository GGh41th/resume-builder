import 'dart:math';

import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';

import '../wdigets/appbar.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _text;

  @override
  void initState() {
    super.initState();
    _text = TextEditingController();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CAppBar(context),
        backgroundColor: LightThemeColors.semiWhite,
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: _height * 0.88,
              decoration: BoxDecoration(color: LightThemeColors.white),
              child: Column(
                children: [
                  Container(
                    height: _height * 0.5,
                    child: Row(
                      children: [
                        SizedBox(
                          height: _height*0.5,
                          width: _width*0.1,
                          child: Center(child: Transform.rotate(angle: pi/2,child: Icon(Icons.arrow_drop_down_sharp,size: 40,color: LightThemeColors.purple,))),
                        ),
                        const Expanded(child: Placeholder()),
                        SizedBox\(
                          height: _height*0.5,
                          width: _width*0.1,
                          child: Center(child: Transform.rotate(angle: pi/2,child: Icon(Icons.arrow_drop_up_sharp,size: 40,color: LightThemeColors.purple))),
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.05,
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _width * 0.1,
                        ),
                        child: TextFormField(
                          controller: _text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 7),
                            hintText: 'Title',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600.withOpacity(0.4),
                              fontSize: _height * 0.032,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height * 0.02,
                        right: _width * 0.25,
                        left: _width * 0.25),
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          minimumSize: MaterialStateProperty.all(
                              Size(_width * 0.12, _height * 0.06))),
                      child: const Text(
                        'Start Editing',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: _height * 0.15,
                        width: _width,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              cercle,
                            )),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}