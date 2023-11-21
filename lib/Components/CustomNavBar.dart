import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Controller/BottomNavigation_controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/AddPost.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/HomePage.dart';
import 'package:rate_my_quilt/View/DashBoard/Messages/MessagePage.dart';
import 'package:rate_my_quilt/View/DashBoard/Profile/MyProfilePage.dart';
import 'package:rate_my_quilt/View/DashBoard/TopRated/BookMarkPage.dart';

class CustomBottomNavBar extends StatefulWidget {
  int index;
  CustomBottomNavBar({required this.index});
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  PageController? _pageController;

  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomNavigationBar(
            iconSize: 45,
            selectedColor: primaryColor,
            strokeColor: Colors.transparent,
            unSelectedColor: Colors.grey,
            backgroundColor: pageBackgroundColor,
            items: [
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              HomePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                        (Route route) => false);
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.leftToRight,
                    //         duration: Duration(milliseconds: 300),
                    //         child: HomePage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.asset(
                      context.read<BottomNavigation_controller>().iconslist[0],
                      color: widget.index == 0 ? primaryColor : Colors.grey,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              BookMarkPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                        (Route route) => false);
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.leftToRight,
                    //         duration: Duration(milliseconds: 300),
                    //         child: BookMarkPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 0, right: 20, top: 10, bottom: 10),
                    child: Image.asset(
                      context.read<BottomNavigation_controller>().iconslist[1],
                      color: widget.index == 1 ? primaryColor : Colors.grey,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              MessagePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                        (Route route) => false);

                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       type: PageTransitionType.leftToRight,
                    //       duration: Duration(milliseconds: 300),
                    //       //child: context.read<BottomNavigation_controller>().screenlist[widget.index]
                    //       child: MessagePage(),
                    //     ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 0, top: 10, bottom: 10),
                    child: Image.asset(
                      context.read<BottomNavigation_controller>().iconslist[2],
                      color: widget.index == 2 ? primaryColor : Colors.grey,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              MyProfilePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                        (Route route) => false);
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.leftToRight,
                    //         duration: Duration(milliseconds: 300),
                    //         child: MyProfilePage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Image.asset(
                      context.read<BottomNavigation_controller>().iconslist[3],
                      color: widget.index == 3 ? primaryColor : Colors.grey,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
            currentIndex: widget.index, //?? _selectedIndex,
            isFloating: false,
            elevation: 0,
            onTap: (index) {
              _selectedIndex = index;
              _pageController!.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }, /**/
          ),
          Positioned(
            left: 155,
            right: 155,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: primaryColor.withOpacity(.6),
                child: Icon(
                  CupertinoIcons.add,
                  color: whitecolor,
                  size: 30,
                ),
                //Icon(Icons.chat_bubble_outline_outlined),
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => AddPost()),
                  //     (Route route) => false);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 300),
                          child: AddPost()));
                },
                //params
              ),
            ),
          )
        ],
      ),
    );
  }
}
