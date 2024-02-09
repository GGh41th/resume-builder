import 'dart:io';

import 'package:codecraft/core/models/sections%20Controller.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:codecraft/ui/wdigets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final GlobalKey<FormState> _formkey;
  late SettingsController _c;
  File? image;

  @override
  void initState() {
    super.initState();
    _c = SettingsController();
    _formkey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return CScreen(context,
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Form(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: changeEmail(_c),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: changePassword(_c),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: changePicture(gallery: ()async {
                    try {
                      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(image == null) return;
                      final imageTemp = File(image.path);
                      setState(() => this.image = imageTemp);
                    } on PlatformException catch(e) {
                      print('Failed to pick image: $e');
                    }

                  },
                  camera: ()async {
                    try {
                      final image = await ImagePicker().pickImage(source: ImageSource.camera);
                      if(image == null) return;
                      final imageTemp = File(image.path);
                      setState(() => this.image = imageTemp);
                    } on PlatformException catch(e) {
                      print('Failed to pick image: $e');
                    }
                  }
                  ),
                )
              ])),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(width:150,height:48,child: FilledButton(onPressed: (){}, child: Text('Save Changes'))),
                ),
              )
            ],
          ),
        ));
  }
}
