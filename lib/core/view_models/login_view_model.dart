import 'package:flutter/material.dart';
import '../../ui/screens/signup.dart';

class LoginViewModel{
  void showSignUpSheet(BuildContext context){
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    showModalBottomSheet(context: context, builder: (context) {
      return const SignUp();
    },
    elevation: 0,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ), barrierColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
    );

  }
}