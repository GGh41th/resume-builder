import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';
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
        Navigator.pushNamed(context, route);
      }, child: Text(text,
        style: TextStyle(
          fontSize: width*0.06
        ),
      ),),
    );
  }
}
