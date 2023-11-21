import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Controller/BottomNavigation_controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/View/DashBoard/AddPost.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final bottomnavcontroller =
    // Provider.of<BottomNavigation_controller>(context, listen: false);
    return Scaffold(
        body: Consumer<BottomNavigation_controller>(
          builder: (context, controller, child) {
            return controller.screenlist[controller.bottomnavindex];
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor.withOpacity(.6),
          child: InkWell(
            onTap: () {
              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 300),
                                      child: AddPost(
                                      )));
            },
            child: Icon(
              CupertinoIcons.add,
              color: whitecolor,
              size: 25,
            ),
          ),
          //Icon(Icons.chat_bubble_outline_outlined),
          onPressed: () {},
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Consumer<BottomNavigation_controller>(
          builder: (context, controller, child) {
            return AnimatedBottomNavigationBar.builder(
              backgroundColor: pageBackgroundColor,
              elevation: 0,
              activeIndex: controller.bottomnavindex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              //   leftCornerRadius: 50,
              // rightCornerRadius: 40,
              onTap: (index) {
                controller.onPagechanged(index);
              },
              itemCount: 4,
              tabBuilder: (int index, bool isActive) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    controller.iconslist[index],
                    color: isActive ? primaryColor: Colors.grey,
                    width: 1,
                    // height: 1,
                    // scale: .5,
                    // fit: BoxFit.contain,
                  ),
                );
              },
            );
          },
        ));
  }
}
