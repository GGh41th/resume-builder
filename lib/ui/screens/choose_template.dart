import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/services/cvmaker.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:codecraft/ui/wdigets/CvBrowser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body:SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: LightThemeColors.white,
                height: 10,
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                  height:400,
                  child:CvBrowser()
              ),
              const SizedBox(
                height:30,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      maxLength: 15,
                      controller: _text,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        //if input is trimmed and empty, return an error message
                        if (value.trim().isEmpty) {
                          return 'Please enter a valid title';
                        }
                        //if the input is less than 3 characters, return an error message
                        if (value.trim().length < 3) {
                          return 'Title must be at least 3 characters long';
                        }
                        return null;
                      },

                      decoration: InputDecoration(

                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        hintText: 'Title',
                        hintStyle: TextStyle(

                          color: Colors.grey.shade600.withOpacity(0.4),
                          fontSize: 25,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validation passed, extract the input value and capitalize the first letter
                      String title = _text.text.trim();
                      //capitalize the first letter of the input
                      title = title.substring(0, 1).toUpperCase() + title.substring(1);
                      print(title);
                      //title = title.substring(0, 1).toUpperCase() + title.substring(1);
                      Provider.of<CVProvider>(context, listen: false).setTitle(title);
                      // Navigate to the next screen with the validated title as a parameter
                      Navigator.pushNamed(context, '/sections');

                  };
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
