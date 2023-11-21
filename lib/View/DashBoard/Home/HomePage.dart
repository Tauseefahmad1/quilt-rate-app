import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_preview/image_preview.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonDropDown.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/HomePageVerticalSwiper.dart';
import 'package:rate_my_quilt/Components/OneStarWidget.dart';
import 'package:rate_my_quilt/Components/StartWidgets.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int check10svalue = 0;

  @override
  void initState() {
    // final getPostscontroller =
    //     Provider.of<HomePage_Controller>(context, listen: false);
    // getPostscontroller.HitGetPosts(context);
    print("objectjectject");
    // createrewarderad();
    // loadrewarded();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //myBanner.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createrewarderad();
    loadnativead();
    final homepagecontroller =
        Provider.of<HomePage_Controller>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await getPostscontroller.HitGetPosts(context);
    // });
    homepagecontroller.HitGetPosts(context);
    context.read<AppBar_Controller>().Hitisnotified(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: 0,
      ),
      backgroundColor: pageBackgroundColor,
      appBar: PreferredSize(
          child: CommonAppBar(
              subtitle: user_name, title: "Hello,", isdropdown: true),
          preferredSize: Size(width(context), 60)),
      body: Expanded(
        child: Container(
          child: Column(
            children: [
              5.sh,
              //  All And Following DropDown
              Consumer<HomePage_Controller>(
                builder: (context, controller, child) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CommonDropDown(
                          Width: width(context) * .35,
                          selectedText: controller.selectedtext,
                          listItem: controller.dropdownlist,
                          onchanged: (val) {
                            return controller.changeDropDownValue(val, context);
                          }),
                    ),
                  );
                },
              ),
              Consumer<HomePage_Controller>(
                builder: (context, controller, child) {
                  if (controller.getPostsModel == null) {
                    return Container();
                  }
                  if (controller.isloading) {
                    return SizedBox(
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade300,
                          child: HomePageVerticalSwiper(
                              sheight: 5,
                              title: "",
                              author: "",
                              authorurl: "null",
                              quilturl: "null",
                              ratting: 0.0,
                              rattingtext: Container(),
                              postid: "",
                              frombookmark: true,
                              userid: "")),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height(context) * .74,
                          child: controller.getPostsModel!.data.isNotEmpty
                              ? PageView.builder(
                                  onPageChanged: (int) {
                                    adcount++;
                                    // current number 5 is the base of slider rewarded ad
                                    if (adcount % 5 == 0) {
                                      // loadrewarded();
                                    }
                                  },
                                  itemCount:
                                      controller.getPostsModel!.data.length,
                                  scrollDirection: Axis.vertical,
                                  controller: _controller,
                                  itemBuilder: (context, index) {
                                    //native ad
                                    // check10svalue = index % 5;
                                    // if (check10svalue == 0) {
                                    //   if (isadloaded == true) {
                                    //     return Container(
                                    //       child: AdWidget(
                                    //         ad: nad,
                                    //       ),
                                    //       alignment: Alignment.center,
                                    //       color: Colors.transparent,
                                    //     );
                                    //   } else {
                                    //     return Center(
                                    //       child: Text("Ad Loading..."),
                                    //     );
                                    //   }
                                    // }
                                    return HomePageVerticalSwiper(
                                      sheight: 5,
                                      endad: true,
                                      imageontap: () {
                                        openImagesPage(
                                          Navigator.of(context),
                                          // heroTags: [(controller.getPostsModel!.data[index].title).toString()],
                                          errorMsg: "Image Loading Fail",
                                          imgUrls: [
                                            (controller.getPostsModel!
                                                    .data[index].image)
                                                .toString(),
                                          ],
                                        );
                                      },
                                      // ratingontap: () {
                                      //   showDialog(
                                      //       context: context,
                                      //       builder: (dialogcontext) {
                                      //         return AlertDialog(
                                      //           title: CommonTextmeri(
                                      //               text:
                                      //                   "Select ratting you want to add",
                                      //               fontweight: FontWeight.w500,
                                      //               fontsize: 15,
                                      //               color: primaryColor),
                                      //           content: Container(
                                      //               padding: EdgeInsets.symmetric(
                                      //                   vertical: 10, horizontal: 5),
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(6),
                                      //                   color: whitecolor),
                                      //               child: Column(
                                      //                 mainAxisSize: MainAxisSize.min,
                                      //                 children: [
                                      //                   Row(
                                      //                     children: [
                                      //                       StartReting(
                                      //                           itemsize: 36.0,
                                      //                           initialRating: double
                                      //                               .parse(controller
                                      //                                   .getPostsModel!
                                      //                                   .data[index]
                                      //                                   .userRating),
                                      //                           onbuttonadd: true,
                                      //                           id: controller
                                      //                               .getPostsModel!
                                      //                               .data[index]
                                      //                               .id,
                                      //                           frombookmark: false),
                                      //                     ],
                                      //                   ),
                                      //                   10.sh,
                                      //                   Align(
                                      //                     alignment:
                                      //                         Alignment.bottomRight,
                                      //                     child: ElevatedButton(
                                      //                       style: ElevatedButton
                                      //                           .styleFrom(
                                      //                               primary:
                                      //                                   primaryColor),
                                      //                       onPressed: () {
                                      //                         homepagecontroller.HitRatting(
                                      //                             double.parse(controller
                                      //                                     .getPostsModel!
                                      //                                     .data[index]
                                      //                                     .id)
                                      //                                 .toString(),
                                      //                             dialogboxsubmitratting
                                      //                                 .toString(),
                                      //                             context);
                                      //                         //submit ratting call
                                      //                         Navigator.pop(context);
                                      //                       },
                                      //                       child: CommonTextmeri(
                                      //                           text: "Submit",
                                      //                           fontweight:
                                      //                               FontWeight.w400,
                                      //                           fontsize: 15,
                                      //                           color: whitecolor),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               )),
                                      //         );
                                      //       });
                                      //},
                                      title: controller
                                          .getPostsModel!.data[index].title,
                                      author: controller
                                          .getPostsModel!.data[index].fullName,
                                      authorurl: controller.getPostsModel!
                                          .data[index].profilePic,
                                      quilturl: controller
                                          .getPostsModel!.data[index].image,
                                      ratting: double.parse((controller
                                              .getPostsModel!
                                              .data[index]
                                              .userRating)
                                          .toString()),
                                      rattingtext: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          OneStarWidget(starsize: 15),
                                          3.sw,
                                          CommonTextmeri(
                                              text:
                                                  "${controller.getPostsModel!.data[index].averageRating} (${controller.getPostsModel!.data[index].totalRating})",
                                              fontweight: FontWeight.w500,
                                              fontsize: 11,
                                              color: blackcolor),
                                        ],
                                      ),
                                      postid: controller
                                          .getPostsModel!.data[index].id,
                                      frombookmark: false,
                                      //true
                                      userid: controller
                                          .getPostsModel!.data[index].userId,
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text("No Posts Avaliable"),
                                ),
                        ),
                        // 10.sh,
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: myBanner.size.width.toDouble(),
                        //   height: myBanner.size.height.toDouble(),
                        //   child: AdWidget(ad: myBanner),
                        // ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
