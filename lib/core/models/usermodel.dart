// a class of user model
 import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
   String? token;
   String? email;
   String? displayName;
   XFile?  photo;
   String? phoneNumber;
   String? address;
   //get token SharedPreferences
   getToken()  async {
     SharedPreferences pref=await SharedPreferences.getInstance();
      token=pref.getString('token');
   }
   changeEmail(String email) async {
     SharedPreferences pref=await SharedPreferences.getInstance();
     pref.setString('email', email);
   }




}