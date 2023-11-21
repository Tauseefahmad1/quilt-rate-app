import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Controller/FollowerFollowing_Controller.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Services/FollowerFollowingService.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserFollowerFollowings.dart';
import 'package:rate_my_quilt/View/DashBoard/Profile/SettingScreen.dart';

class ProfilePageHeader extends StatelessWidget {
  String posts, followers, following, subtitle, title, profileurl, logintype;
  var followontap, messageontap;
  String id;
  bool myprofile, isfollowed, frommyprofile;
  ProfilePageHeader({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.profileurl,
    required this.posts,
    required this.followers,
    required this.logintype,
    this.frommyprofile = false,
    required this.following,
    required this.followontap,
    required this.messageontap,
    required this.myprofile,
    required this.isfollowed,
  });

  @override
  Widget build(BuildContext context) {
    final followerfollowingcontroller =
        Provider.of<FollowerFollowing_Controller>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor),
                ),
                child: ClipRRect(
                  child: CachedNetworkImage(
                      imageUrl: profileurl,
                      imageBuilder: (context, imageProvider) => Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                              color: whitecolor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(color: primaryColor),
                      errorWidget: (context, url, error) {
                        print("objecterror$url");
                        return CircularProgressIndicator();
                      }
                      // const Icon(Icons.error),
                      ),
                  //  Image.network(
                  //   profileurl,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            10.sw,
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.sh,
                  CommonTextmeri(
                      text: title,
                      fontweight: FontWeight.w400,
                      fontsize: 20,
                      color: secondryColor),
                  10.sh,
                  Consumer<HomePage_Controller>(
                    builder: (context, controller, child) {
                      return Wrap(
                        children:subtitle.length<45? [
                          CommonTextmeri(
                              talign: TextAlign.start,
                              text: subtitle,
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                              color: Color(0XFF6A5E5EA8).withOpacity(.66),
                            ),
                        ]:[
                         controller.isshowmore? Container(
                            height:30,
                            child: CommonTextmeri(
                              talign: TextAlign.start,
                              text: subtitle,
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                              color: Color(0XFF6A5E5EA8).withOpacity(.66),
                            ),
                          ):CommonTextmeri(
                              talign: TextAlign.start,
                              text: subtitle,
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                              color: Color(0XFF6A5E5EA8).withOpacity(.66),
                            ),
                          InkWell(
                            onTap: () {
                              controller.showmore(!controller.isshowmore);
                            },
                            child: CommonTextmeri(
                              talign: TextAlign.start,
                              text: controller.isshowmore
                                  ?"Show More..."
                                  : "Show Less..." ,
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                              color: primaryColor.withOpacity(.66),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // Wrap(
                  //   children: [
                  //     CommonTextmeri(
                  //         talign: TextAlign.start,
                  //         text: subtitle,
                  //         fontweight: FontWeight.w400,
                  //         fontsize: 12,
                  //         color: Color(0XFF6A5E5EA8).withOpacity(.66)),
                  //   ],
                  // )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: frommyprofile
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 300),
                                  child: SettingScreen(
                                    logintype: logintype,
                                  )));
                        },
                        child: Icon(Icons.settings,color: primaryColor,))
                    : Container())
          ],
        ),
        20.sh,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonTextmeri(
                      text: convert(int.parse(posts)).toString(),
                      fontweight: FontWeight.w400,
                      fontsize: 18,
                      color: secondryColor),
                  CommonTextmeri(
                      text: "Posts",
                      fontweight: FontWeight.w400,
                      fontsize: 16,
                      color: secondryColor),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  followerfollowingcontroller.hitfollowing(
                      context, int.parse(id));
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 300),
                          child: UserFollowerFollowings(
                            type: "Following",
                          )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonTextmeri(
                        text: convert(int.parse(following)).toString(),
                        fontweight: FontWeight.w400,
                        fontsize: 18,
                        color: secondryColor),
                    CommonTextmeri(
                        text: "Following",
                        fontweight: FontWeight.w400,
                        fontsize: 16,
                        color: secondryColor),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  followerfollowingcontroller.hitfollower(
                      context, int.parse(id));
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 300),
                          child: UserFollowerFollowings(
                            type: "Followers",
                          )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonTextmeri(
                        text: convert(int.parse(followers)).toString(),
                        fontweight: FontWeight.w400,
                        fontsize: 18,
                        color: secondryColor),
                    CommonTextmeri(
                        text: "Followers",
                        fontweight: FontWeight.w400,
                        fontsize: 16,
                        color: secondryColor),
                  ],
                ),
              ),
            ),
          ],
        ),
        20.sh,
        myprofile == false
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: myid != id
                    ? Row(children: [
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                                height: 40,
                                child: !isfollowed
                                    ? CommonButton2(
                                        ontap: followontap,
                                        title: "Follow",
                                      )
                                    : InkWell(
                                        onTap: followontap,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: primaryColor)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 56,
                                          child: Center(
                                            child: CommonTextpopp(
                                                text: "Following",
                                                fontweight: FontWeight.w700,
                                                fontsize: 21,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ))),
                        15.sw,
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                                height: 40,
                                child: CommonButton2(
                                  ontap: messageontap,
                                  title: "Message",
                                ))),
                      ])
                    : Container(),
              )
            : Container()
      ],
    );
  }
}
