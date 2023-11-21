import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Bindings/bindings.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';
import 'package:rate_my_quilt/View/DashBoard/BottomNavigation.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/HomePage.dart';
import 'package:rate_my_quilt/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var devices = ['18C0718957473935C676446A415112D9'];
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  RequestConfiguration request = RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(request);
  final prefs = await SharedPreferences.getInstance();
  e_mail = prefs.getString(Keys.email).toString();
  if (e_mail == "" || e_mail == "null") {
    //login
    runApp(const MyApp());
  } else {
    //home
    user_name = prefs.getString(Keys.fullname).toString();
    profile = prefs.getString(Keys.profilepic).toString();
    token = prefs.getString(Keys.token).toString();
    myid = prefs.getString(Keys.myid).toString();
    runApp(const MyAppHome());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: bindings,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rate My Quilt',
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
          primarySwatch: Colors.purple,
        ),
        home: Login(),
      ),
    );
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: bindings,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rate My Quilt',
        theme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          primarySwatch: Colors.purple,
        ),
        home: //cropapp(),
            //BottomNavigation(),
            HomePage(),
      ),
    );
  }
}
