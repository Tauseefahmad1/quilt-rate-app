import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonDropDown.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/NotificationScreen.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/SearchScreen.dart';

class CommonAppBar extends StatelessWidget {
  String subtitle, title;
  bool isdropdown;
  CommonAppBar({
    required this.subtitle,
    required this.title,
    this.isdropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Container(
          height: 70,
          child: ListTile(
            tileColor: Colors.transparent,
            title: CommonTextmeri(
              text: title,
              fontweight: FontWeight.w400,
              fontsize: 18,
              color: primaryColor,
              talign: TextAlign.left,
            ),
            subtitle: CommonTextmeri(
              text: subtitle,
              fontweight: FontWeight.w700,
              fontsize: 22,
              color: secondryColor,
              talign: TextAlign.left,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 300),
                                child: SearchScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 45,
                        height: 45,
                        child: SvgPicture.asset(searchicon,
                            color: primaryColor,
                            semanticsLabel:
                                'A red up arrow'), //Image.asset(searchicon,color: primaryColor),
                        // Icon(
                        //   Icons.search,
                        //   color:primaryColor,
                        // ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0XFFF8E6E6),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(2, 2))
                          ],
                          shape: BoxShape.circle,
                          color: whitecolor,
                        ),
                      ),
                    ),
                    17.sw,
                    Consumer<AppBar_Controller>(
                      builder: (context, controller, child) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 300),
                                      child: NotificationScreen()));
                            },
                            child: controller.havnotification
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 45,
                                    height: 45,
                                    child: SvgPicture.asset(
                                      notificationiconred,
                                    ), //Image.asset(notificationicon,color: primaryColor,),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0XFFF8E6E6),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                            offset: Offset(2, 2))
                                      ],
                                      shape: BoxShape.circle,
                                      color: whitecolor,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 45,
                                    height: 45,
                                    child: SvgPicture.asset(
                                      notificationicon,
                                      color: primaryColor,
                                    ), //Image.asset(notificationicon,color: primaryColor,),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0XFFF8E6E6),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                            offset: Offset(2, 2))
                                      ],
                                      shape: BoxShape.circle,
                                      color: whitecolor,
                                    ),
                                  ));
                      },
                    )
                  ],
                ),
                //  isdropdown?
                // Expanded(
                //   child: Consumer<HomePage_Controller>(
                //      builder: (context, controller, child) {
                //        return CommonDropDown(
                //                 Width: width(context) * .3,
                //                 selectedText: controller.selectedtext,
                //                 listItem: controller.dropdownlist,
                //                 onchanged: (val) {
                //                   return controller.changeDropDownValue(val);
                //                 });
                //      },
                //    ),
                // ) :Expanded(child: Container()),
              ],
            ),
          ),
        ),

        //  AppBar(
        //   titleSpacing: 10.0,
        //   elevation: 0,
        //   backgroundColor: pageBackgroundColor,
        //   title: CommonTextmeri(
        //       text: title,
        //       fontweight: FontWeight.w700,
        //       fontsize: 22,
        //       color: blackcolor),
        //   automaticallyImplyLeading: false,
        //   actions: [
        //       InkWell(
        //         onTap: () {
        //           // Navigator.push(context,
        //           //     MaterialPageRoute(builder: (context) => Reminder()));
        //         },
        //         child: Container(
        //           margin: EdgeInsets.only(top: 10, bottom: 10),
        //           width: 35,
        //           height: 35,
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(notificationicon),
        //                 fit: BoxFit.cover),
        //             borderRadius: BorderRadius.circular(5),
        //             color: whitecolor,
        //           ),
        //         ),
        //       ),
        //     10.sw,
        //   ],
        // ),
      ),
    );
  }
}

class CommonAppBar2 extends StatelessWidget {
  String subtitle, title, profileurl;
  CommonAppBar2({
    required this.subtitle,
    required this.title,
    required this.profileurl,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ListTile(
          title: CommonTextmeri(
            text: title,
            fontweight: FontWeight.w400,
            fontsize: 18,
            color: primaryColor,
            talign: TextAlign.left,
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextmeri(
                text: subtitle,
                fontweight: FontWeight.w700,
                fontsize: 22,
                color: secondryColor,
                talign: TextAlign.left,
              ),
              5.sw,
              Container(
                width: 15,
                height: 15,
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Reminder()));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 97,
                  height: 97,
                  decoration: BoxDecoration(
                    // boxShadow: [BoxShadow(color: Color(0XFFF6D1EBC7),blurRadius: .5,spreadRadius: 10)],
                    image: DecorationImage(
                      image: NetworkImage(profileurl),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: blackcolor.withOpacity(.3),
                          blurRadius: 50,
                          spreadRadius: 3,
                          offset: Offset(1, 1))
                    ],
                    shape: BoxShape.circle,
                    color: whitecolor,
                  ),
                ),
              ),
              17.sw,
            ],
          ),
        ),
      ),
    );
  }
}
