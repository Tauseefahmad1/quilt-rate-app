import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Services/MyProfileApiService.dart';
import 'package:rate_my_quilt/Services/SearchPostService.dart';

class Search_Controller extends ChangeNotifier {
  bool isloading = false;
  TextEditingController search = TextEditingController();
  GetPostsModel? getpostmodel;
  bool havesearchtext=false;
  searchValidator(bool val){
havesearchtext=val;
notifyListeners();
  }
  Hitsearch(BuildContext context) async {
    {
      isloading = true;
      notifyListeners();
      var res = await SearchPostService.searchpostNow(
          context: context, title: search.text.toString());
      if (res is GetPostsModel) {
        getpostmodel = res;
        isloading = false;
        notifyListeners();
        if (getpostmodel!.status == 200) {
          isloading = false;
          notifyListeners();
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(getpostmodel.message.toString())));
        }
      } else {
        isloading = false;
        notifyListeners();
      }
    }
  }
}
