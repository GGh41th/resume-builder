import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  CScreen(
      context,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/jalel.png'),
            ),
             SizedBox(height: 20),
            itemProfile('Name', 'Jalel Lkadri', CupertinoIcons.person),
            SizedBox(height: 10),
            itemProfile('Phone', '4 - 4 - 2', CupertinoIcons.phone),
            SizedBox(height: 10),
            itemProfile('Address', 'citée , Manzeh', CupertinoIcons.location),
            SizedBox(height: 10),
            itemProfile('Email', 'Jalel_Lkadricoach@gmail.com', CupertinoIcons.mail),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text('Edit Profile')
              ),
            )
          ],
        ),
      ),
    );
  }
  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: LightThemeColors.purple.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
