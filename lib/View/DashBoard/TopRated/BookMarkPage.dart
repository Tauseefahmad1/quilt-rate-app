import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_preview/image_preview.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/HomePageVerticalSwiper.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/BookMark_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Components/OneStarWidget.dart';

class BookMarkPage extends StatefulWidget {
  BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //myBanner.dispose();
  }

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    //myBanner.load();
    final bookmarkcontroller =
        Provider.of<BookMark_Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await bookmarkcontroller.HitGetPosts(context);
    });
context.read<AppBar_Controller>().Hitisnotified(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: 1,
      ),
      backgroundColor: pageBackgroundColor,
      appBar: PreferredSize(
          child: CommonAppBar(subtitle: "Rated", title: "Top"),
          preferredSize: Size(width(context), 70)),
      body: Center(child: Consumer<BookMark_Controller>(
        builder: (context, controller, child) {
          if (controller.isloading) {
            return SizedBox(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.shade300,
                  child: HomePageVerticalSwiper(
                      sheight: 20,
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
//Center(child: CircularProgressIndicator());
          } else {
            if (controller.getPostsModel == null) {
              return Container();
            }

            return Column(
              children: [
                SizedBox(
                  height: height(context) * .74,
                  child: controller.getPostsModel!.data.isNotEmpty
                      ? PageView.builder(
                          itemCount: controller.getPostsModel!.data.length,
                          scrollDirection: Axis.vertical,
                          controller: _controller,
                          itemBuilder: (context, index) {
                            return HomePageVerticalSwiper(
                              sheight: 20,
                              endad: true,
                              imageontap: () {
                                openImagesPage(
                                  Navigator.of(context),
                                  // heroTags: [(controller.getPostsModel!.data[index].title).toString()],
                                  errorMsg: "Image Loading Fail",
                                  imgUrls: [
                                    (controller
                                            .getPostsModel!.data[index].image)
                                        .toString(),
                                  ],
                                );
                              },
                              title:
                                  controller.getPostsModel!.data[index].title,
                              author: controller
                                  .getPostsModel!.data[index].fullName,
                              authorurl: controller
                                  .getPostsModel!.data[index].profilePic,
                              quilturl:
                                  controller.getPostsModel!.data[index].image,
                              ratting: double.parse(controller
                                  .getPostsModel!.data[index].userRating),
                              rattingtext:
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min, children: [
                                      OneStarWidget(starsize: 15),
                                      CommonTextmeri(
                                        text: "${controller.getPostsModel!.data[index].averageRating} (${controller.getPostsModel!.data[index].totalRating})",
                                        fontweight: FontWeight.w500,
                                        fontsize: 11,
                                        color: blackcolor),],),
                              postid: controller.getPostsModel!.data[index].id,
                              frombookmark: false,
                              userid:
                                  controller.getPostsModel!.data[index].userId,
                            );
                          },
                        )
                      : Center(
                          child: Text("No Posts Found"),
                        ),
                ),
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
      )),
    );
  }
}
