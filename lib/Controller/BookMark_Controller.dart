import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Services/AddRatingService.dart';
import 'package:rate_my_quilt/Services/GetPostService.dart';
import 'package:rate_my_quilt/Services/GetTopRatedPostService.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class BookMark_Controller extends ChangeNotifier {
  bool isloading = false;
  GetPostsModel? getPostsModel;
  HitGetPosts(BuildContext context) async {
    isloading = true;
    notifyListeners();
    var getposts = await GetTopRatedPostService.getpostNow(context: context);
    if (getposts is GetPostsModel) {
      getPostsModel = getposts;
      isloading = false;
      notifyListeners();
    } else {
      isloading = true;
      notifyListeners();
    }
  }


  HitRatting(String id,String ratting,BuildContext context) async {
    // isloading = true;
    // notifyListeners();
    bool rating = await AddRatingService.AddRattingNow(id: id, ratting: ratting, context: context);
    if (rating) {
      print("Ratting done");
      //fluttertoast("Ratting Updated Successfully");
      // isloading = false;
      // notifyListeners();
    } else {
      // isloading = true;
      // notifyListeners();
    }
  }
}
