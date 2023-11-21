import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/ProfilePageHeader.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/BottomNavigation_controller.dart';
import 'package:rate_my_quilt/Controller/MyProfile_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserTimeLine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPostscontroller =
        Provider.of<MyProfile_Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getPostscontroller.HitMyProfile(context);
    });
context.read<AppBar_Controller>().Hitisnotified(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: 3,
      ),
        backgroundColor: pageBackgroundColor,
        body: Consumer<MyProfile_Controller>(
          builder: (context, controller, child) {
            if (controller.myprofilemodel==null) {
              return Container();
            }
            if (controller.isloading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ProfilePageHeader(
                      id: controller.myprofilemodel!.data.id.toString(),
                      logintype: controller.myprofilemodel!.data.loginType.toString(),
                      frommyprofile: true,
                      title: controller.myprofilemodel!.data.fullName,
                      subtitle:
                          controller.myprofilemodel!.data.aboutMe.toString() ==
                                  "null"
                              ? "About Me Goes Here"
                              : controller.myprofilemodel!.data.aboutMe,
                      profileurl: controller.myprofilemodel!.data.profilePic,
                      posts: (controller.myprofilemodel!.data.posts.length)
                          .toString(),
                      followers:
                          controller.myprofilemodel!.data.followers.toString(),
                      following:
                          controller.myprofilemodel!.data.followings.toString(),
                      followontap: () {},
                      messageontap: () {},
                      myprofile: true,
                      isfollowed: false,
                    ),
                    21.sh,
                    GridView.builder(
                      itemCount: controller.myprofilemodel!.data.posts.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: .75,
                          crossAxisSpacing: 4.24,
                          mainAxisSpacing: 4,
                          mainAxisExtent: 160),
                      itemBuilder: (BuildContext context, int index) {
                        print("abcdf");
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    child: UserTimeLine(
                                        getPostsModel:
                                            controller.myprofilemodel!,initindex: index,)));
                          },
                          child: Image.network(controller
                              .myprofilemodel!.data.posts[index].image
                              .toString()),
                        );
                      },
                    ),
                    20.sh,
                    
                    // CommonButton2(
                    //     title: "Delete Account",
                    //     redcolor: true,
                    //     ontap: () {       
                    //     }),
                  ],
                ),
              ));
            }
          },
        ));
  }
}
