import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
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

class UserTimeLine extends StatelessWidget {
  var getPostsModel;
  int initindex;
  UserTimeLine(
      {required this.getPostsModel, required this.initindex, super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController(initialPage: initindex);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
                      index: 0,
                    ),
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
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
                          imageUrl: getPostsModel.data.profilePic,
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
                          text: getPostsModel.data.fullName.toString(),
                          fontweight: FontWeight.w400,
                          fontsize: 20,
                          color: secondryColor),
                      10.sh,
                      Wrap(
                        children: [
                          CommonTextmeri(
                              talign: TextAlign.start,
                              text: getPostsModel.data.aboutMe.toString() =="null"? "About Me goes Here":getPostsModel.data.aboutMe.toString(),
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                              color: Color(0XFF6A5E5EA8).withOpacity(.66)),
                        ],
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(
              height: height(context) * .74,
              child: PageView.builder(
                itemCount: getPostsModel.data.posts.length,
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
                          (getPostsModel.data.posts[index].image).toString(),
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
                    //                                   .posts[index].userRating),
                    //                           onbuttonadd: true,
                    //                           id: getPostsModel
                    //                               .data.posts[index].id,
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
                    title: getPostsModel.data.posts[index].title,
                    author: getPostsModel.data.posts[index].fullName,
                    authorurl: getPostsModel.data.posts[index].profilePic,
                    quilturl: getPostsModel.data.posts[index].image,
                    ratting: double.parse(
                        getPostsModel.data.posts[index].userRating),
                    rattingtext:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min, children: [
                                      OneStarWidget(starsize: 15),
                                      CommonTextmeri(
                                        text: "${getPostsModel.data.posts[index].averageRating} (${getPostsModel.data.posts[index].totalRating})",
                                        fontweight: FontWeight.w500,
                                        fontsize: 11,
                                        color: blackcolor),],),
                    postid: getPostsModel.data.posts[index].id,
                    frombookmark: false,
                    endad: true,
                    userid: getPostsModel.data.posts[index].userId,
                  );
                },
              )),
        ],
      )),
    );
  }
}
