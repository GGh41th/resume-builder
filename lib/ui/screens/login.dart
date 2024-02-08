import 'dart:convert';

import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/core/view_models/login_view_model.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/global/generaldata/assets_paths.dart';
import '../../core/models/login_request_model.dart';
import '../../core/models/reponse_error_model.dart';
import '../../core/models/reponse_sucess_model.dart';
import '../../core/services/auth_services/auth_api_services.dart';
import '../../core/services/cvmaker.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool visible = true;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
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
    LoginViewModel loginView= LoginViewModel();
    return Container(
        decoration: BoxDecoration(
          color: LightThemeColors.semiWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        height: height * 0.7,
        padding: MediaQuery.of(context).viewInsets,
        width: width,
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
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
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                labelText: 'Email',
                              ),
                            ),
                             SizedBox(
                              height: height*0.02,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a valid password';
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
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                suffixIcon: IconButton(
                                    onPressed: changeVisibility,
                                    icon: Icon(visible
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded)),
                                labelText: 'Password',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(LightThemeColors.purple),
                        fixedSize: MaterialStateProperty.all(
                            Size(width * 0.8, height * 0.06)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var x = await APIService.logIn(LoginModel(
                              email: _email.text.trim(),
                              password: _password.text.trim()));
                          if (x.statusCode == 200) {
                            var res = RSuccessModel.fromJson(json.decode(x.body));
                            SharedPreferences pref =
                            await SharedPreferences.getInstance();
                            pref.setString('token', res.token);
                            Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false,);
                            print(pref.getString('token'));
                          } else {
                            String ? err;
                            var res = RErrorModel.fromJson(json.decode(x.body));
                            if(["Wrong email","Wrong password"].contains(res.message)){
                              err="wrong credentials";
                            }
                            else
                            {
                              err="An error has occurred";
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:  Row(
                                children: [
                                  Icon(CommunityMaterialIcons.hand_okay),
                                  Text(err,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))
                                ],
                              ),
                              backgroundColor: LightThemeColors.purple,
                            ));
                          }
                        }
                      },
                      child: Text(
                        'Log In',
                        style:
                        TextStyle(color: LightThemeColors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    Text('Or use the following methods:',
                    style: TextStyle(
                      color: LightThemeColors.purple,
                      fontSize: 18
                    ),),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            radius: width * 0.08,
                            backgroundImage: const AssetImage(google1)),
                        CircleAvatar(
                            radius: width * 0.08,
                            backgroundImage: const AssetImage(whatsup2)),
                        CircleAvatar(
                            radius: width * 0.08,
                            backgroundImage: const AssetImage(facebook1)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account yet ? ",
                          style: TextStyle(
                            color: LightThemeColors.purple,
                            fontSize: 16
                          ),),
                          GestureDetector(
                            onTap: () {
                             loginView.showSignUpSheet(context);
                            },
                            child: Text('Sign Up',
                            style: TextStyle(
                              color: LightThemeColors.purple,
                              fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      )
                    )
            
                  ],
                ),
              ),
            ),
            Expanded(child:
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: width,
                height: height*0.1,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/cercles.png',
                  ),
                ),
              ),
            ),

            )
          ],
        )
    );
  }
}
