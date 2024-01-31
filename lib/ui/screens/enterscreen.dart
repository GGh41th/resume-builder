import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/wdigets/enter_screen_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/global/generaldata/assets_paths.dart';
import '../wdigets/enter_screen_row_widget.dart';


class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _State();
}

class _State extends State<EnterScreen> {
  @override
  Widget build(BuildContext context) {
    final  double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: LightThemeColors.purple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
              Padding(
                padding:  EdgeInsets.only(top:height*0.15,right: width*0.1,left: width*0.1,bottom: height*0.06),
                child: Image.asset(logoAllWhite,),
              ),
           Padding(
             padding:  EdgeInsets.only(left: width*0.095,right: width*0.095),
             child: const FittedBox(
               fit: BoxFit.fill,
               child: Text('Create your resume',
                 style: TextStyle(
                   color: Colors.white
                 ),
               ),
             ),
           ),
          Padding(
            padding:  EdgeInsets.only(left: width*0.4,right: width*0.4,bottom: height*0.02),
            child: const FittedBox(
              fit: BoxFit.fill,
              child: Center(
                child: Text('Now!',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
          ),
         const ERow(text: 'Over 20 Templates',icon: Icons.copy),
          const ERow(icon: Icons.file_download_outlined, text: 'Instant download'),
          const ERow(icon: CupertinoIcons.gear, text:'Fully Customaizable Cv'),
          const EButton(text: 'log in',route: 'login'),
          const EButton(text: 'Sign up',route: 'signup',)
        ],
      ),
    );
  }
}
