import 'dart:math';

import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:codecraft/ui/wdigets/CvBrowser.dart';
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
    return CScreen(context,
        body:Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: LightThemeColors.white,
                height: 10,
              ),
              SizedBox(height: 20,),
              Container(
                  height:400,
                  child:CvBrowser()
              ),
              SizedBox(
                height:30,
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
              SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sections');
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    minimumSize: MaterialStateProperty.all(
                        Size(_width * 0.12, _height * 0.06)),
                    backgroundColor: MaterialStateProperty.all(
                        LightThemeColors.purple),

                ),
                child: const Text(
                  'Start Editing',
                  style: TextStyle(fontSize: 24),
                ),
              ),

            ],
          ),
        ),);
  }
}
