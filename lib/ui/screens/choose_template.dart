import 'package:codecraft/core/global/generaldata/assets_paths.dart';
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:flutter/material.dart';
class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: LightThemeColors.semiWhite,
      body:Container(
        decoration: BoxDecoration(
          color: LightThemeColors.white
        ),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: _height*0.45,

            ),
            Expanded(child: Container(
              child: Align(
                child: Image.asset(cercle),
              ),
            ))
          ],
        ),

      )
    );
  }
}
