import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:community_material_icon/community_material_icon.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;
  late final TextEditingController _cpassword;
  bool visible = true;
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _cpassword = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _cpassword.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      decoration:  BoxDecoration(
        color: LightThemeColors.semiWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      height: height * 0.7,
      child: Column(
        children: [

          Expanded(
            child: Container(
              width: double.infinity,

              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              width: width * 0.86,
                              height: height * 0.05,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (!EmailValidator.validate(value)) {
                                    return 'Enter a valid Email';
                                  }
                                  return null;
                                },
                                controller: _name,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  hintText: 'User Name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // ... Other form fields
                      ],
                    ),
                  ),
                  // ... Other widgets
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
