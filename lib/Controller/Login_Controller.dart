import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/LoginModel.dart';
import 'package:rate_my_quilt/Services/LoginService.dart';
import 'package:rate_my_quilt/Services/SocialLogin.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/DashBoard/BottomNavigation.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Controller extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginformKey = GlobalKey();
  bool isloading = false;
  HitLogin(BuildContext context) async {
    if (loginformKey.currentState!.validate()) {
      {
        final prefs = await SharedPreferences.getInstance();
        isloading = true;
        notifyListeners();
        var res = await LoginService.loginNow(
            username: email.text.toString(),
            password: password.text.toString(),
            context: context);
        if (res is LoginModel) {
          LoginModel loginmodel = res;
          prefs.setString(Keys.token, loginmodel.data.token.toString());
          prefs.setString(Keys.email, loginmodel.data.email.toString());
          prefs.setString(Keys.fullname, loginmodel.data.fullName.toString());
          prefs.setString(
              Keys.profilepic, loginmodel.data.profilePic.toString());
          prefs.setString(Keys.myid, loginmodel.data.id.toString());
          e_mail = prefs.getString(Keys.email)!;
          user_name = prefs.getString(Keys.fullname)!;
          profile = prefs.getString(Keys.profilepic)!;
          token = prefs.getString(Keys.token).toString();
          myid = prefs.getString(Keys.myid).toString();
          isloading = false;
          notifyListeners();
          if (loginmodel.status == 200) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text(loginmodel.message.toString())));
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => BottomNavigation()));
            Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                          (Route route) => false);
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => HomePage())); //BottomNavigation()));
          }
        } else {
          isloading = false;
          notifyListeners();
        }
      }
    }
  }




  HitSocialLogin(BuildContext context,String name,String email,String logintype, ) async {
    final prefs = await SharedPreferences.getInstance();
    isloading = true;
    notifyListeners();
       var res=await SocialLoginService.loginNow(username: name, email: email, logintype: logintype, context: context);
   if (res is LoginModel) {
     LoginModel loginmodel = res;
          prefs.setString(Keys.token, loginmodel.data.token.toString());
          prefs.setString(Keys.email, loginmodel.data.email.toString());
          prefs.setString(Keys.fullname, loginmodel.data.fullName.toString());
          prefs.setString(
              Keys.profilepic, loginmodel.data.profilePic.toString());
          prefs.setString(
              Keys.myid, loginmodel.data.id.toString());
          e_mail = prefs.getString(Keys.email)!;
          user_name = prefs.getString(Keys.fullname)!;
          profile = prefs.getString(Keys.profilepic)!;
          token = prefs.getString(Keys.token).toString();
          myid = prefs.getString(Keys.myid).toString();
   isloading = false;
    notifyListeners();
   } else {
     isloading = false;
    notifyListeners();
   }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));//BottomNavigation()));
  }
}
