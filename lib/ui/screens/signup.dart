import 'dart:convert';
import 'dart:math';

import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/models/reponse_sucess_model.dart';
import 'package:codecraft/core/models/signup_request_model.dart';
import 'package:codecraft/core/services/auth_services/auth_api_services.dart';
import 'package:codecraft/core/view_models/signup_model_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../core/models/reponse_error_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _lname;
  late final TextEditingController _fname;
  late final TextEditingController _cpassword;
  bool visible = false;
  bool _checked = false;
  SignUpViewModel signUpView = SignUpViewModel();

  @override
  void initState() {
    super.initState();
    _fname = TextEditingController();
    _lname = TextEditingController();
    _cpassword = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _cpassword.dispose();
    _lname.dispose();
    _fname.dispose();
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
      decoration: BoxDecoration(
        color: LightThemeColors.semiWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      //min height is 70% of the screen
      height: height * 0.7,
      width: width,
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _fname,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        labelText: 'First Name',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _lname,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        labelText: 'Last Name',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Enter a valid Email';
                        }
                        return null;
                      },
                      controller: _email,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid password';
                        }
                        if(value.length<8 && !value.contains(RegExp(r'[A-Z]')) && !value.contains(RegExp(r'[a-z]')) && !value.contains(RegExp(r'[0-9]')) && value.contains(RegExp(r'[^\w\s]'))){
                          print('fefefe');
                          return 'Password too weak , Required a 8 long password contains upper,lower and special char';
                        }
                        return null;
                      },
                      obscureText: !visible,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: _password,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        suffixIcon: IconButton(
                          onPressed: changeVisibility,
                          icon: Icon(
                            visible == true
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Ur Password pls';
                        } else if (value != _password.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                      obscureText: !visible,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: _cpassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        suffixIcon: IconButton(
                            onPressed: changeVisibility,
                            icon: Icon(visible == true
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded)),
                        labelText: 'Confirm Password',
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _checked,
                          onChanged: (value) {
                            setState(() {
                              _checked = value as bool;
                            });
                          },
                        ),
                        const Text.rich(
                          TextSpan(
                              text: 'Agree to',
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                    text: 'Terms and conditions',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ],
                    ),
                    //signup button
                    const SizedBox(
                      height: 10,
                    ),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(LightThemeColors.purple),
                        fixedSize: MaterialStateProperty.all(Size(width*0.8, height*0.06)),
                      ),
                      child: const Text('Sing Up'),
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          if (!_checked) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                    'Please agree to the terms and conditions')));
                          }
                          else{
                            var x=await ApiAuthService.signUp(SignupModel(fName: _fname.text.trim(),lName: _lname.text.trim(), email:_email.text.trim(), password: _password.text.trim()));
                            if(x.statusCode==200){
                                print(x.body);
                              var res=RSuccessModel.fromJson(json.decode(x.body));
                              // if(context.mounted) {
                              //   print("zeregef");
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: const Row(
                              //           children: [
                              //             Icon(
                              //                 CommunityMaterialIcons.hand_okay),
                              //             Text(
                              //                 'You have been Successfully signed in,You will be redirected',
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: 20
                              //                 )
                              //             )
                              //           ],
                              //         ),
                              //         backgroundColor: LightThemeColors.purple,
                              //       ));
                              // }
                                Future.delayed(
                                  const Duration(seconds: 1, milliseconds: 500),
                                      () {
                                    signUpView.showLogInSheet(context);
                                  },
                                );

                          }
                              else
                                {
                                  //print(x.body);
                                  var res=RErrorModel.fromJson(json.decode(x.body));
                                  //print(res.message);
                                      if(res.message=="Email Taken"){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content:  Row(
                                            children: [
                                              Transform.rotate(angle: pi,child: const Icon(CommunityMaterialIcons.hand_okay)),
                                              const Text(
                                                  'Email Already in use',
                                                  style: TextStyle(color: Colors.white,
                                                      fontSize: 20
                                                  )
                                              )
                                            ],
                                          ),
                                          backgroundColor: LightThemeColors.purple,
                                        ));
                                      }
                                }
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height*0.1,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  'assets/cercles.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
