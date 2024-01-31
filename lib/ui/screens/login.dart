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
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
    
      height: height * 0.7,
      padding: MediaQuery.of(context).viewInsets,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                    const SizedBox(
                      height:15,
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(LightThemeColors.purple),
                fixedSize: MaterialStateProperty.all(Size(width*0.8, height*0.06)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/home');
                }
              },
              child: Text('Log In',style: TextStyle(color: LightThemeColors.white,
                  fontSize: 20
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
