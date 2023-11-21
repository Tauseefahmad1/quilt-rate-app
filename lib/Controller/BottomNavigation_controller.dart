import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/DashBoard/TopRated/BookMarkPage.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/HomePage.dart';
import 'package:rate_my_quilt/View/DashBoard/Messages/MessagePage.dart';
import 'package:rate_my_quilt/View/DashBoard/Profile/MyProfilePage.dart';

class BottomNavigation_controller extends ChangeNotifier {
  PageController pageController = PageController();
  int bottomnavindex = 0;
  List<Widget> screenlist = [
    HomePage(),
    BookMarkPage(),
    MessagePage(),
    MyProfilePage()
  ];
  List<String> iconslist = [
    homeicon,
    bookmarkicon,
    messageicon,
    profileicon,
  ];

  onPagechanged(int index) {
    bottomnavindex = index;
    print("index is : $index");
    notifyListeners();
  }

  GlobalKey bottomNavigationKey = GlobalKey();
}
