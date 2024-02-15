import 'package:flutter/material.dart';

import '../screens/login.dart';
import '../screens/signup.dart';
class EButton extends StatelessWidget {
  const EButton ({super.key,required this.text,required this.route});
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(top:10,left: width*0.2,right: width*0.2),
      child: ElevatedButton(onPressed: (){
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            if(route=="login") {
              return const Login();
            } else {
              return const SignUp();
            }
          },
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          useRootNavigator: true,
          //i dont that the screen in baground have some flou

        );
      }, child: Text(text,
        style: TextStyle(
          fontSize: width*0.06
        ),
      ),),
    );
  }
}
