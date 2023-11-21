import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Controller/Login_Controller.dart';
import 'package:rate_my_quilt/Model/LoginModel.dart';
import 'package:rate_my_quilt/Services/SocialLogin.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

AlertDialog AlertDialogBox({required String title}) {
  return AlertDialog(
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: whitecolor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor, width: .5),
              ),
              child: Icon(
                Icons.check,
                size: 50,
                color: primaryColor,
              ),
            ),
            14.sh,
            CommonTextmeri(
                text: "Email Sent",
                fontweight: FontWeight.w700,
                fontsize: 32,
                color: Color(0XFF6A5E5EA8).withOpacity(.66)),
            15.sh,
            CommonTextmeri(
                text:
                    "We sent an email to $title with a link to get back into your account",
                fontweight: FontWeight.w400,
                fontsize: 13,
                color: Color(0XFF949494)),
          ],
        )),
  );
}

convert(int num) {
  if (num > 999 && num < 99999 || -num > 999 && -num < 99999) {
    return "${(num / 1000).toStringAsFixed(1)} K";
  } else if (num > 99999 && num < 999999 || -num > 99999 && -num < 999999) {
    return "${(num / 1000).toStringAsFixed(0)} K";
  } else if (num > 999999 && num < 999999999 ||
      -num > 999999 && -num < 999999999) {
    return "${(num / 1000000).toStringAsFixed(1)} M";
  } else if (num > 999999999 || -num > 999999999) {
    return "${(num / 1000000000).toStringAsFixed(1)} B";
  } else {
    return num.toString();
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return "Enter a valid email address";
  else
    return null;
}

String? validatePassword(String? val) {
  if (val == "" || val == null) {
    return "Enter your Password";
  } else if (val.length > 8) {
    return "Enter 8 character Password";
  }
  return null;
}

googlelogin({required BuildContext context}) async {
  //fire base login function
  String email, imageurl, name, id;
LoginModel? loginmodel;
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // log(FirebaseAuth.instance.currentUser.toString());
  email = googleUser.email;
  imageurl = googleUser.photoUrl.toString();
  name = googleUser.displayName.toString();
  id = googleUser.id.toString();
  // for passing data to firebase
  await FirebaseAuth.instance.signInWithCredential(credential);
  //end firebase login function

  if (name != null || name != "") {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setString(Keys.fullname, name);
    // prefs.setString(Keys.profilepic, imageurl);
    // prefs.setString(Keys.email, email);
    // user_name = prefs.getString(Keys.fullname)!;
    // profile = prefs.getString(Keys.profilepic)!;
    // e_mail = prefs.getString(Keys.email)!;
    // myid = prefs.getString(Keys.myid).toString();
   
   

   context.read<Login_Controller>().HitSocialLogin(context, name, email, "google");
  //  var res=await SocialLoginService.loginNow(username: name, email: email, logintype: "google", context: context);
  //  if (res is LoginModel) {
  //    LoginModel loginmodel = res;
  //         prefs.setString(Keys.token, loginmodel.data.token.toString());
  //         prefs.setString(Keys.email, loginmodel.data.email.toString());
  //         prefs.setString(Keys.fullname, loginmodel.data.fullName.toString());
  //         prefs.setString(
  //             Keys.profilepic, loginmodel.data.profilePic.toString());
  //         prefs.setString(
  //             Keys.myid, loginmodel.data.id.toString());
  //         e_mail = prefs.getString(Keys.email)!;
  //         user_name = prefs.getString(Keys.fullname)!;
  //         profile = prefs.getString(Keys.profilepic)!;
  //         token = prefs.getString(Keys.token).toString();
  //         myid = prefs.getString(Keys.myid).toString();
  //  } else {
     
  //  }
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => BottomNavigation()));
  }
}

//email/name/pic in login
//emailor phone/name/pic in flutter

fluttertoast(String toastmessage) {
  Fluttertoast.showToast(
      msg: toastmessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}


Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}


AlertDialog imageSource() {
  return AlertDialog(
    title: CommonTextmeri(text: "Select Image Source", fontweight: FontWeight.w500, fontsize: 15, color: primaryColor),
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: whitecolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: CommonTextmeri(
                  text:
                      "Gallary",
                  fontweight: FontWeight.w400,
                  fontsize: 15,
                  color: secondryColor),
            ),
                InkWell(
                  child: CommonTextmeri(
                  text:
                      "Camera",
                  fontweight: FontWeight.w400,
                  fontsize: 15,
                  color: secondryColor),
                ),
          ],
        )),
  );
}



AlertDialog InternetConnectivityDialogBox() {
  return AlertDialog(
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: whitecolor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonTextmeri(
                text:
                    "Internet is not Connected",
                fontweight: FontWeight.w400,
                fontsize: 13,
                color: Color(0XFF949494)),
          ],
        )),
  );
}


String? fcmtoken = '';
firebasegetfcmtoken()async{
  await FirebaseMessaging.instance.getToken().then((tok) {
      log("token is : $tok");
      fcmtoken = tok;
    });
}
  