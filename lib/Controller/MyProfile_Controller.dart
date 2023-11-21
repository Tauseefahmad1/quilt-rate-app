import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/MyProfileModel.dart';
import 'package:rate_my_quilt/Services/MyProfileApiService.dart';

class MyProfile_Controller extends ChangeNotifier {
  bool isloading = false;
  MyProfileModel? myprofilemodel;
  HitMyProfile(BuildContext context) async {
    {
      isloading = true;
      notifyListeners();
      var res = await MyProfileApiService.myProfileNow(
          context: context);
      if (res is MyProfileModel) {
        myprofilemodel = res;
        isloading = false;
        notifyListeners();
        if (myprofilemodel!.status == 200) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(myprofilemodel.message.toString())));
        }
      } else {
        isloading = false;
        notifyListeners();
      }
    }
  }
}
