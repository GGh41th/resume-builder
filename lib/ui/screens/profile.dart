import 'package:codecraft/core/global/theme/app_colors/light_colors.dart';
import 'package:codecraft/ui/screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/view_models/get_user_info_view_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {


  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return  cScreen(
      context,
      body: FutureBuilder(future: GetUserInfoViewModel.getUserInfo(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        else if(snapshot.data is Text){
          return snapshot.data;
        }
        else if(snapshot.data==null){
          print('ma fama chayy');
          return Placeholder();
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/jalel.png'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', snapshot.data.get('firstName')+' '+snapshot.data.get('lastName'), CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '4 - 4 - 2', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile('Address', 'citée , Manzeh', CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile('Email', snapshot.data.get('email'), CupertinoIcons.mail),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Edit Profile')
                ),
              )
            ],
          ),
        );
      },)
    );
  }
  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
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


