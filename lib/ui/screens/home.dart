
import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/wdigets/appbar.dart';
import 'package:codecraft/ui/wdigets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LightThemeColors.semiWhite,
      appBar: cAppBar(context),
      drawer: cDrawer(context),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.4,mainAxisSpacing:10 ), itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 15,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 10.0,
                      ),
                    ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35))
                ),
                width: width*0.35,
                height: height*0.3,
                child: Center(
                    child: Icon(CupertinoIcons.add,size: 130,color: LightThemeColors.purple,)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*0.001),
              child: Text(
                'Cv ${index + 1}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

          ],
        );
      },),
    );
  }
}

