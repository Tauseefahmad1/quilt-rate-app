import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/ProfilePageHeader.dart';
import 'package:rate_my_quilt/Controller/MyProfile_Controller.dart';
import 'package:rate_my_quilt/Controller/UserProfile_Controller.dart';
import 'package:rate_my_quilt/Services/CreateChatService.dart';
import 'package:rate_my_quilt/Services/GetMessageService.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserTimeLine.dart';
import 'package:rate_my_quilt/View/DashBoard/Messages/ChatScreen.dart';

class UserProfilePage extends StatefulWidget {
  String userid;
  UserProfilePage({required this.userid, super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? thischatid;
  @override
  void initState() {
    final userProfilecontroller =
        Provider.of<UserProfile_Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await userProfilecontroller.HitUserProfile(context, widget.userid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
                      index: 0,
                    ),
        backgroundColor: pageBackgroundColor,
        body: Consumer<UserProfile_Controller>(
          builder: (context, controller, child) {
            if (controller.isloading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ProfilePageHeader(
                      id: controller.userprofilemodel!.data.id,
                      title: controller.userprofilemodel!.data.fullName,
                      subtitle: controller.userprofilemodel!.data.aboutMe
                                  .toString() ==
                              "null"
                          ? "About Me Place Here..."
                          : controller.userprofilemodel!.data.aboutMe
                              .toString(),
                      profileurl: controller.userprofilemodel!.data.profilePic,
                      posts: controller.userprofilemodel!.data.posts.length
                          .toString(),
                      followers: controller.userprofilemodel!.data.followers
                          .toString(),
                      following: controller.userprofilemodel!.data.followings
                          .toString(),
                      followontap: () {
                        //here toggle call
                        controller.hitTogglefollow(
                            context: context, id: widget.userid);
                      },
                      messageontap: () async {
                        thischatid =
                            controller.userprofilemodel!.data.chatId.toString();

                        if (controller.userprofilemodel!.data.chatId
                                .toString() ==
                            "0") {
                          //create chat api call for user id//
                          var uid = await CreateChatService.createchatNow(
                              userid: controller.userprofilemodel!.data.id,
                              context: context);
                          thischatid = uid.toString();
                          print(uid);
                        }
                        print("thischatid" + thischatid.toString());
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 300),
                                child: ChatScreen(
                                  title: controller
                                      .userprofilemodel!.data.fullName,
                                  imageurl: controller
                                      .userprofilemodel!.data.profilePic,
                                  chatid: thischatid!,
                                )));
                      },
                      myprofile: false,
                      logintype: "",
                      isfollowed: controller.userprofilemodel!.data.isFollowed,
                    ),
                    21.sh,
                    GridView.builder(
                      itemCount: controller.userprofilemodel!.data.posts.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: .75,
                          crossAxisSpacing: 4.24,
                          mainAxisSpacing: 4,
                          mainAxisExtent: 160),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    child: UserTimeLine(
                                        getPostsModel:
                                            controller.userprofilemodel!,initindex: index,)));
                          },
                          child: Image.network(controller
                              .userprofilemodel!.data.posts[index].image
                              .toString()),
                        );
                      },
                    ),
                    20.sh,
                  ],
                ),
              ));
            }
          },
        ));
  }
}
