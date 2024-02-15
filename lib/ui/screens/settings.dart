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
   final GlobalKey<FormState> _formkeymail= GlobalKey<FormState>();
   final GlobalKey<FormState> _formkeypass= GlobalKey<FormState>();
    final GlobalKey<FormState> _formkeypic= GlobalKey<FormState>();
  late final SettingsController _c = SettingsController();


  File? image;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return CScreen(context,
        body: Column(
          //mainAxisSize: MainAxisSize.max,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: changeEmail(_c, _formkeymail),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: changePassword(_c, _formkeypass),
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
            ]),
            (image==null) ? Container() :Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Image.file(image!),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          image = null;
                        });
                      },
                      child: const Text('Remove Picture'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text('Save Picture'),)
                  ],
                )
              ],
            ),

          ],
        ));
  }
}
