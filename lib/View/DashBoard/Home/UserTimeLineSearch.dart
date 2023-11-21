import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/HomePageVerticalSwiper.dart';
import 'package:rate_my_quilt/Components/OneStarWidget.dart';
import 'package:rate_my_quilt/Components/StartWidgets.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Model/UserProfileModel.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class UserTimeLineSearch extends StatelessWidget {
  GetPostsModel getPostsModel;
  int initindex;
  UserTimeLineSearch(
      {required this.getPostsModel, required this.initindex, super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController(initialPage: initindex);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
                      index: 0,
                    ),
        appBar: PreferredSize(
            child: CommonAppBar(
              title: "Search",
              subtitle: "Items",
            ),
            preferredSize: Size(width(context), 60)),
          body: Column(
        children: [
          SizedBox(
              height: height(context) * .74,
              child: PageView.builder(
                itemCount: getPostsModel.data.length,
                scrollDirection: Axis.vertical,
                controller: _controller,
                itemBuilder: (context, index) {
                  return HomePageVerticalSwiper(
                    sheight: 20,
                    imageontap: () {
                      openImagesPage(
                        Navigator.of(context),
                        // heroTags: [(controller.getPostsModel!.data.posts[index].title).toString()],
                        errorMsg: "Image Loading Fail",
                        imgUrls: [
                          (getPostsModel.data[index].image).toString(),
                        ],
                      );
                    },
                    // ratingontap: () {
                    //   showDialog(
                    //       context: context,
                    //       builder: (dialogcontext) {
                    //         return AlertDialog(
                    //           title: CommonTextmeri(
                    //               text: "Select ratting you want to add",
                    //               fontweight: FontWeight.w500,
                    //               fontsize: 15,
                    //               color: primaryColor),
                    //           content: Container(
                    //               padding: EdgeInsets.symmetric(
                    //                   vertical: 10, horizontal: 5),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   color: whitecolor),
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   Row(
                    //                     children: [
                    //                       StartReting(
                    //                           itemsize: 36.0,
                    //                           initialRating: double.parse(
                    //                               getPostsModel.data
                    //                                   [index].userRating),
                    //                           onbuttonadd: true,
                    //                           id: getPostsModel
                    //                               .data[index].id,
                    //                           frombookmark: false),
                    //                     ],
                    //                   ),
                    //                   10.sh,
                    //                   Align(
                    //                     alignment: Alignment.bottomRight,
                    //                     child: ElevatedButton(
                    //                       style: ElevatedButton.styleFrom(
                    //                           primary: primaryColor),
                    //                       onPressed: () {
                    //                         // homepagecontroller.HitRatting(
                    //                         //     double.parse(controller
                    //                         //             .getPostsModel!
                    //                         //             .data.posts[index]
                    //                         //             .id)
                    //                         //         .toString(),
                    //                         //     dialogboxsubmitratting
                    //                         //         .toString(),
                    //                         //     context);

                    //                         //submit ratting call
                    //                         Navigator.pop(context);
                    //                       },
                    //                       child: CommonTextmeri(
                    //                           text: "Submit",
                    //                           fontweight: FontWeight.w400,
                    //                           fontsize: 15,
                    //                           color: whitecolor),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               )),
                    //         );
                    //       });
                    // },
                    title: getPostsModel.data[index].title,
                    endad: true,
                    author: getPostsModel.data[index].fullName,
                    authorurl: getPostsModel.data[index].profilePic,
                    quilturl: getPostsModel.data[index].image,
                    ratting: double.parse(
                        getPostsModel.data[index].userRating),
                    rattingtext:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min, children: [
                                      OneStarWidget(starsize: 15),
                                      CommonTextmeri(
                                        text: "${getPostsModel.data[index].averageRating} (${getPostsModel.data[index].totalRating})",
                                        fontweight: FontWeight.w500,
                                        fontsize: 11,
                                        color: blackcolor),],),
                    postid: getPostsModel.data[index].id,
                    frombookmark: false,
                    userid: getPostsModel.data[index].userId,
                  );
                },
              )),
        ],
      )),
    );
  }
}
