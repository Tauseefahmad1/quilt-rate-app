import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Controller/AddPost_Controller.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/BookMark_Controller.dart';
import 'package:rate_my_quilt/Controller/BottomNavigation_controller.dart';
import 'package:rate_my_quilt/Controller/Chat_Controller.dart';
import 'package:rate_my_quilt/Controller/DeleteAccount_Controller.dart';
import 'package:rate_my_quilt/Controller/FollowerFollowing_Controller.dart';
import 'package:rate_my_quilt/Controller/ForgotPassword_Controller.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Controller/Login_Controller.dart';
import 'package:rate_my_quilt/Controller/Message_Controller.dart';
import 'package:rate_my_quilt/Controller/MyProfile_Controller.dart';
import 'package:rate_my_quilt/Controller/Notification_Controller.dart';
import 'package:rate_my_quilt/Controller/PostRatting_Controller.dart';
import 'package:rate_my_quilt/Controller/Search_Controller.dart';
import 'package:rate_my_quilt/Controller/Setting_Controller.dart';
import 'package:rate_my_quilt/Controller/SignUp_Controller.dart';
import 'package:rate_my_quilt/Controller/UserProfile_Controller.dart';

var bindings = [
  ChangeNotifierProvider<Login_Controller>(
    create: (context) => Login_Controller(),
  ),
  ChangeNotifierProvider<SignUp_Controller>(
    create: (context) => SignUp_Controller(),
  ),
  ChangeNotifierProvider<ForgotPassword_Controller>(
    create: (context) => ForgotPassword_Controller(),
  ),
  ChangeNotifierProvider<BottomNavigation_controller>(
    create: (context) => BottomNavigation_controller(),
  ),
  ChangeNotifierProvider<AddPost_Controller>(
    create: (context) => AddPost_Controller(),
  ),
  ChangeNotifierProvider<HomePage_Controller>(
    create: (context) => HomePage_Controller(),
  ),
  ChangeNotifierProvider<BookMark_Controller>(
    create: (context) => BookMark_Controller(),
  ),
  ChangeNotifierProvider<MyProfile_Controller>(
    create: (context) => MyProfile_Controller(),
  ),
  ChangeNotifierProvider<UserProfile_Controller>(
    create: (context) => UserProfile_Controller(),
  ),
  ChangeNotifierProvider<Message_Controller>(
    create: (context) => Message_Controller(),
  ),
  ChangeNotifierProvider<Chat_Controller>(
    create: (context) => Chat_Controller(),
  ),
  ChangeNotifierProvider<Notification_Controller>(
    create: (context) => Notification_Controller(),
  ),
  ChangeNotifierProvider<Search_Controller>(
    create: (context) => Search_Controller(),
  ),
  ChangeNotifierProvider<DeleteAccount_Controller>(
    create: (context) => DeleteAccount_Controller(),
  ),
  ChangeNotifierProvider<Setting_Controller>(
    create: (context) => Setting_Controller(),
  ),
  ChangeNotifierProvider<FollowerFollowing_Controller>(
    create: (context) => FollowerFollowing_Controller(),
  ),
  ChangeNotifierProvider<PostRatting_Controller>(
    create: (context) => PostRatting_Controller(),
  ),
  ChangeNotifierProvider<AppBar_Controller>(
    create: (context) => AppBar_Controller(),
  ),
];