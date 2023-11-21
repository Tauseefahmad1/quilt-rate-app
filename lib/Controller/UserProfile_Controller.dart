import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/MyProfileModel.dart';
import 'package:rate_my_quilt/Model/UserProfileModel.dart';
import 'package:rate_my_quilt/Services/FollowService.dart';
import 'package:rate_my_quilt/Services/MyProfileApiService.dart';
import 'package:rate_my_quilt/Services/UserProfileService.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserProfile.dart';

class UserProfile_Controller extends ChangeNotifier {
  bool isloading = false;
  UserProfileModel? userprofilemodel;
  HitUserProfile(BuildContext context, String id) async {
    {
      isloading = true;
      notifyListeners();
      var res =
          await UserProfileService.userProfileNow(userid: id, context: context);
      log('res here is $res');
      if (res is UserProfileModel) {
        userprofilemodel = res;
        isloading = false;
        notifyListeners();
        if (userprofilemodel!.status == 200) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(myprofilemodel.message.toString())));
        }
      } else {
        isloading = false;
        notifyListeners();
      }
    }
  }

  bool isfollowed = false;
  hitTogglefollow({required BuildContext context, required String id}) async {
    isfollowed = userprofilemodel!.data.isFollowed;
    var res = await FollowService.FollowNow(userid: id, context: context);
    if (res) {
     // fluttertoast("Follow Updated");
      Navigator.pop(context);
      
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserProfilePage(
                    userid: id,
                  )));
    } else {}
  }
}
