import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration:  BoxDecoration(
        color: LightThemeColors.semiWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      height: height * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(233, 237, 240, 0.8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
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
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: height * 0.05,
                          width: width * 0.86,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a valid password';
                                }
                                return null;
                              },
                              obscureText: visible,
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
                                suffix: IconButton(
                                    onPressed: changeVisibility,
                                    icon: Icon(visible
                                        ? Icons.remove_red_eye
                                        : Icons.password_sharp)),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.03, bottom: height * 0.03),
                  child: SizedBox(
                    height: height * 0.06,
                    width: width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(LightThemeColors.purple),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: Text('Log In',style: TextStyle(color: LightThemeColors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
