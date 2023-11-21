import 'dart:developer';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/StartWidgets.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Controller/PostRatting_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserProfile.dart';

class HomePageVerticalSwiper extends StatefulWidget {
  String title, author, authorurl, quilturl, postid, userid;
  double ratting, sheight;
  Widget rattingtext;
  bool frombookmark, endad;
  var imageontap, ratingontap;

  HomePageVerticalSwiper({
    required this.title,
    required this.author,
    required this.authorurl,
    required this.quilturl,
    required this.ratting,
    required this.rattingtext,
    required this.postid,
    required this.sheight,
    this.endad = false,
    required this.frombookmark,
    required this.userid,
    this.imageontap = 0,
    this.ratingontap = 0,
  });

  @override
  State<HomePageVerticalSwiper> createState() => _HomePageVerticalSwiperState();
}

class _HomePageVerticalSwiperState extends State<HomePageVerticalSwiper> {
  final PageController _controller = PageController();

  late BannerAd bannerAd;

  bool isBannerAdLoaded = false;
  // var adUnit = 'ca-app-pub-3940256099942544/6300978111';

  @override
  initState() {
    initBannerAd();
    super.initState();
  }

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: '',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          log('MK: AdFailed to load: $error');
        },
      ), // BannerAdListener
      request: const AdRequest(),
    ); // BannerAd
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    return Expanded(
      child: Column(
        children: [
          10.sh,
          InkWell(
            onTap: widget.imageontap == 0 ? () {} : widget.imageontap,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: height(context) * .57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                  image: DecorationImage(
                      image: widget.quilturl == "null"
                          ? NetworkImage(
                              "https://pyxis.nymag.com/v1/imgs/460/9a5/572b5c710d84ee4422469435b96ca08999-quilts-lede.jpg")
                          : NetworkImage(widget.quilturl),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 90,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color(0XFF6C6C6C).withOpacity(0.39),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              9.sh,
                              Column(
                                children: [
                                  Text(widget.title,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: whitecolor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      )),
                                ],
                              ),
                              Transform.translate(
                                offset: Offset(0, 00),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.leftToRight,
                                            duration:
                                                Duration(milliseconds: 300),
                                            child: UserProfilePage(
                                              userid: widget.userid,
                                            )));
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  leading: CachedNetworkImage(
                                      imageUrl: widget.authorurl.toString(),
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
                                      }
                                      // const Icon(Icons.error),
                                      ),
                                  // Container(
                                  //     width: 50,
                                  //     height: 50,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       image: DecorationImage(
                                  //           image: NetworkImage(authorurl)),
                                  //       color: whitecolor,
                                  //     )),
                                  title: Transform.translate(
                                    offset: Offset(-15, 0),
                                    child: CommonTextmeri(
                                        text: widget.author,
                                        talign: TextAlign.left,
                                        fontweight: FontWeight.w400,
                                        fontsize: 19,
                                        color: whitecolor),
                                  ),
                                  trailing: Text(""),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: 65,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  print("nullnullnullnullnull");
                                  context
                                      .read<PostRatting_Controller>()
                                      .hitpostratting(
                                          context, int.parse(widget.postid));
                                  showModalBottomSheet(
                                      barrierColor:
                                          Colors.black.withOpacity(.4),
                                      enableDrag: true,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: height(context) * .4,
                                          child:
                                              Consumer<PostRatting_Controller>(
                                            builder:
                                                (context, controller, child) {
                                              if (controller
                                                      .postrattingmodel!.data ==
                                                  null) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else if (controller.isloading) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            height(context) *
                                                                .05,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            CommonTextmeri(
                                                                text: "Ratings",
                                                                talign:
                                                                    TextAlign
                                                                        .start,
                                                                fontweight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontsize: 15,
                                                                color:
                                                                    primaryColor),
                                                            InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(Icons
                                                                    .close)),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            height(context) *
                                                                .35,
                                                        child: controller
                                                                    .postrattingmodel!
                                                                    .data
                                                                    .length ==
                                                                0
                                                            ? Center(
                                                                child: CommonTextmeri(
                                                                    text:
                                                                        "No Rated Yet",
                                                                    talign:
                                                                        TextAlign
                                                                            .start,
                                                                    fontweight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontsize:
                                                                        15,
                                                                    color:
                                                                        primaryColor),
                                                              )
                                                            : ListView.builder(
                                                                itemCount:
                                                                    controller
                                                                        .postrattingmodel!
                                                                        .data
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Container(
                                                                    width: width(
                                                                        context),
                                                                    child:
                                                                        ListTile(
                                                                      leading: CachedNetworkImage(
                                                                          imageUrl: widget.authorurl.toString(),
                                                                          imageBuilder: (context, imageProvider) => Container(
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
                                                                          placeholder: (context, url) => CircularProgressIndicator(color: primaryColor),
                                                                          errorWidget: (context, url, error) {
                                                                            print("objecterror$url");
                                                                            return CircularProgressIndicator();
                                                                          }
                                                                          // const Icon(Icons.error),
                                                                          ),
                                                                      subtitle:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.bottomLeft,
                                                                        child:
                                                                            StartReting(
                                                                          itemsize:
                                                                              10,
                                                                          initialRating: double.parse(controller.postrattingmodel!.data[index].rating) /
                                                                              15 *
                                                                              9,
                                                                          id: widget
                                                                              .postid,
                                                                          frombookmark:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                      title: CommonTextmeri(
                                                                          text: controller
                                                                              .postrattingmodel!
                                                                              .data[
                                                                                  index]
                                                                              .fullName,
                                                                          talign: TextAlign
                                                                              .start,
                                                                          fontweight: FontWeight
                                                                              .w200,
                                                                          fontsize:
                                                                              15,
                                                                          color:
                                                                              primaryColor),
                                                                    ),
                                                                  );
                                                                }),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: 37,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whitecolor,
                                  ),
                                  child: Center(
                                    child: Transform.rotate(
                                      angle: 0, //20
                                      child: widget.rattingtext,
                                      // CommonTextmeri(
                                      //     text: rattingtext, //"⭐ 5.0 (1K)",
                                      //     fontweight: FontWeight.w500,
                                      //     fontsize: 11,
                                      //     color: blackcolor),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.sh,
          InkWell(
              onTap: widget.ratingontap == 0 ? () {} : widget.ratingontap,
              child: Consumer<HomePage_Controller>(
                builder: (context, controller, child) {
                  return AbsorbPointer(
                    absorbing: controller.ratingloading,
                    child: StartReting(
                      initialRating: widget.ratting / 15 * 9,
                      id: widget.postid,
                      frombookmark: widget.frombookmark,
                    ),
                  );
                },
              )),
          // SizedBox(
          //   height: sheight,
          // ),
          10.sh,

          widget.endad
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: primaryColor),
                      color: whitecolor),
                  alignment: Alignment.center,
                  width: width(context) * .8,
                  height: 50,
                  child: isBannerAdLoaded
                      ? SizedBox(
                          height: bannerAd.size.height.toDouble(),
                          width: bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: bannerAd),
                        )
                      : Center(
                          child: Text(
                            "Banner Ad Will be place here",
                            style: TextStyle(color: primaryColor),
                          ),
                        ))
              : Container(),
          SizedBox(
            height: 15,
          ),
          // Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         border: Border.all(width: 1, color: primaryColor),
          //         color: whitecolor),
          //     alignment: Alignment.center,
          //     width: width(context) * .8,
          //     height: 90,
          //     child: isBannerAdLoaded
          //         ? SizedBox(
          //             height: bannerAd.size.height.toDouble(),
          //             width: bannerAd.size.width.toDouble(),
          //             child: AdWidget(ad: bannerAd),
          //           )
          //         : Center(
          //             child: Text(
          //               "Native Ad Will be place here",
          //               style: TextStyle(color: primaryColor),
          //             ),
          //           )),
          // SizedBox(
          //   height: 10,
          // )

          //bannerad

          // endad
          //     ? Container(
          //         alignment: Alignment.center,
          //         width: myBanner.size.width.toDouble(),
          //         height: myBanner.size.height.toDouble(),
          //         child: AdWidget(ad: myBanner))
          //     : Container(),
        ],
      ),
    );
  }
}
