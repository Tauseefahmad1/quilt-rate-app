// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/FollowerFollowing_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserProfile.dart';

class UserFollowerFollowings extends StatelessWidget {
  String type;
  UserFollowerFollowings({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          index: 0,
        ),
        backgroundColor: pageBackgroundColor,
        appBar: PreferredSize(
            child: CommonAppBar(
              subtitle: "Screen",
              title: type,
            ),
            preferredSize: Size(width(context), 60)),
        body: Consumer<FollowerFollowing_Controller>(
          builder: (context, controller, child) {
            if (controller.isloading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: primaryColor,
                        )),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: TextFormField(
                      controller: controller.searchcontroller,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          controller.searchlist = [];
                          return;
                        }
                        controller.searchlist = controller.responsemodel!.data
                            .where((element) => element.fullName
                                .toString()
                                .toLowerCase()
                                .contains(value.toString().toLowerCase()))
                            .toList();
                        controller.hitupdate();
                        print(value);
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 10, bottom: 10),
                          hintText: "Search Here",
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  controller.searchcontroller.text.isEmpty
                      ? controller.responsemodel!.data.length==0?
                       CommonTextmeri(text: "There is no $type", fontweight: FontWeight.w400, fontsize: 15, color: primaryColor)
                            :ListView.builder(
                          itemCount: controller.responsemodel!.data.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), //<-- SEE HERE
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 300),
                                          child: UserProfilePage(
                                            userid: controller
                                                .responsemodel!.data[index].userId,
                                          )));
                                },
                                tileColor: Colors.grey.shade300,
                                leading: CachedNetworkImage(
                                    imageUrl: controller
                                        .responsemodel!.data[index].profilePic
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          height: 30,
                                          width: 30,
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
                                        CircularProgressIndicator(
                                            color: primaryColor),
                                    errorWidget: (context, url, error) {
                                      print("objecterror$url");
                                      return CircularProgressIndicator();
                                    }),
                                title: Transform.translate(
                                  offset: Offset(0, 0),
                                  child: CommonTextmeri(
                                      text: controller
                                          .responsemodel!.data[index].fullName,
                                      fontweight: FontWeight.w500,
                                      talign: TextAlign.start,
                                      fontsize: 20,
                                      color: primaryColor),
                                ),
                                trailing: Text(""),
                              ),
                            );
                          },
                        )
                      : controller.searchlist!.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.searchlist!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), //<-- SEE HERE
                                    ),
                                    tileColor: Colors.grey.shade300,
                                    onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 300),
                                          child: UserProfilePage(
                                            userid: controller.searchlist![index].userId
                                          )));
                                },
                                    leading: CachedNetworkImage(
                                        imageUrl: controller
                                            .searchlist![index].profilePic
                                            .toString(),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  height: 30,
                                                  width: 30,
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
                                            CircularProgressIndicator(
                                                color: primaryColor),
                                        errorWidget: (context, url, error) {
                                          print("objecterror$url");
                                          return CircularProgressIndicator();
                                        }),
                                    title: Transform.translate(
                                      offset: Offset(0, 0),
                                      child: CommonTextmeri(
                                          text: controller
                                              .searchlist![index].fullName,
                                          fontweight: FontWeight.w500,
                                          talign: TextAlign.start,
                                          fontsize: 20,
                                          color: primaryColor),
                                    ),
                                    trailing: Text(""),
                                  ),
                                );
                              },
                            )
                          : CommonTextmeri(
                              text: "Not Found",
                              fontweight: FontWeight.w500,
                              fontsize: 18,
                              color: primaryColor)
                ],
              ),
            );
          },
        ));
  }
}
