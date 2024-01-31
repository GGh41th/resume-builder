import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
  bool visible = false;
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
                        labelText: 'User Name',
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!_checked) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                    'Please agree to the terms and conditions')));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Row(
                              children: [
                                Icon(CommunityMaterialIcons.hand_okay),
                                Text(
                                    'You have been Successfully signed in,You will be redirected',
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 20
                                    )
                                )
                              ],
                            ),
                            backgroundColor: LightThemeColors.purple,
                          ));
                          Future.delayed(
                            const Duration(seconds: 1, milliseconds: 500),
                            () {
                              Navigator.pushNamed(context, '/login');
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/cercles.png',
              width: width,
            ),
            //ther rest with be a purple container
            Container(
        
              color: LightThemeColors.purple,
        
            )
          ],
        ),
      ),
    );
  }
}
