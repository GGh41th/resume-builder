import 'package:codecraft/ui/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpViewModel{
  void showLogInSheet(BuildContext context){
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(); // Close the old modal if possible
    }
    showModalBottomSheet(context: context, builder: (context) {
      return Login();
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