import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/BottomNavigation_controller.dart';
import 'package:rate_my_quilt/Controller/DeleteAccount_Controller.dart';
import 'package:rate_my_quilt/Controller/Setting_Controller.dart';
import 'package:rate_my_quilt/Services/DeleteAccountService.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/Auth/ChangePassword.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';
import 'package:rate_my_quilt/View/DashBoard/Profile/EditProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  String logintype;
  SettingScreen({required this.logintype, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: 3,
      ),
      backgroundColor: pageBackgroundColor,
      appBar: PreferredSize(
          child: CommonAppBar(
            subtitle: "Screen",
            title: "Setting",
          ),
          preferredSize: Size(width(context), 60)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            20.sh,
            CachedNetworkImage(
                  imageUrl: profile.toString(),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 60,
              backgroundImage: imageProvider,
            ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: primaryColor),
                  errorWidget: (context, url, error) {
                    print("objecterror$url");
                    return CircularProgressIndicator();
                  }
                  // const Icon(Icons.error),
                  ),
            
            20.sh,
            CommonTextmeri(
                text: user_name,
                fontweight: FontWeight.w500,
                fontsize: 18,
                color: primaryColor),
            20.sh,
            CommonButton2(
                title: "Edit Profile",
                ontap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 300),
                          child: EditProfile()));
                }),
            20.sh,
            logintype == "email"
                ? CommonButton2(
                    title: "Change Password",
                    ontap: () async {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 300),
                              child: ChangePassword()));
                    })
                : SizedBox(),
            logintype == "email" ? 20.sh : SizedBox(),
            CommonButton2(
                title: "SignOut",
                ontap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: CommonTextmeri(
                              text: "Are You Sure You Want To LogOut?",
                              fontweight: FontWeight.w500,
                              fontsize: 15,
                              color: primaryColor),
                          content: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: whitecolor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: primaryColor),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: CommonTextmeri(
                                        text: "Cancel",
                                        fontweight: FontWeight.w400,
                                        fontsize: 15,
                                        color: whitecolor),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      context
                                          .read<BottomNavigation_controller>()
                                          .bottomnavindex = 0;
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(Keys.email, "");
                                      await GoogleSignIn().signOut();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
                                          (Route route) => false);
                                    },
                                    child: CommonTextmeri(
                                        text: "Signout",
                                        fontweight: FontWeight.w400,
                                        fontsize: 15,
                                        color: whitecolor),
                                  ),
                                ],
                              )),
                        );
                      });
                }),
            20.sh,
            CommonButton2(
                title: "Delete Account",
                redcolor: true,
                ontap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: CommonTextmeri(
                              text: "Are You Sure You Want To Delete Account?",
                              fontweight: FontWeight.w500,
                              fontsize: 15,
                              color: primaryColor),
                          content: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: whitecolor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: primaryColor),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: CommonTextmeri(
                                        text: "Cancel",
                                        fontweight: FontWeight.w400,
                                        fontsize: 15,
                                        color: whitecolor),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      context
                                          .read<DeleteAccount_Controller>()
                                          .Hitdelete(context);
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(Keys.email, "");
                                      prefs.setString(Keys.fullname, "");
                                      prefs.setString(Keys.myid, "");
                                      prefs.setString(Keys.profilepic, "");
                                      prefs.setString(Keys.token, "");
                                      await GoogleSignIn().signOut();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: CommonTextmeri(
                                        text: "Delete",
                                        fontweight: FontWeight.w400,
                                        fontsize: 15,
                                        color: whitecolor),
                                  ),
                                ],
                              )),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
