import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Services/AddRatingService.dart';
import 'package:rate_my_quilt/Services/GetPostService.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class HomePage_Controller extends ChangeNotifier {
  bool isloading = false,isshowmore=true;
  GetPostsModel? getPostsModel;
  List<String> dropdownlist = ["All", "Following"];
  String selectedtext = "All";

  changeDropDownValue(String val,BuildContext context) {
    selectedtext = val;
    if (val=="All") {
      HitGetPosts(context);
    } else {
      HitfollowerPosts(context);
    }
    
    notifyListeners();
  }

showmore(moreshow){
isshowmore=moreshow;
notifyListeners();
}
  HitGetPosts(BuildContext context) async {
    isloading = true;
    //notifyListeners();
    var getposts = await GetPostService.getpostNow(context: context);
    if (getposts is GetPostsModel) {
      getPostsModel = getposts;
      //
      // insert mod 5 index for ads integeration
      // int lenght = getposts.data.length;
      // int c = lenght ~/ 5;
      // int totallength = c + lenght;
      // for (var i = 0; i < totallength; i++) {
      //   if (i % 5 == 0) {
      //     getPostsModel!.data.insert(i, Datum(id: "", userId: "", title: "", image: "", fullName: "", profilePic: "", userRating: "", totalRating: "", averageRating: ""));
      //   }
      // }
      //
      
      isloading = false;
      notifyListeners();
    } else {
      isloading = true;
      notifyListeners();
    }
  }



  HitfollowerPosts(BuildContext context) async {
    isloading = true;
    //notifyListeners();
    var getposts = await GetPostService.getfollowerpostNow(context: context);
    if (getposts is GetPostsModel) {
      getPostsModel = getposts;
      // native ad index logic after 5 index 
      // int lenght = getposts.data.length;
      // int c = lenght ~/ 5;
      // int totallength = c + lenght;
      // for (var i = 0; i < totallength; i++) {
      //   if (i % 5 == 0) {
      //     getPostsModel!.data.insert(i, Datum(id: "", userId: "", title: "", image: "", fullName: "", profilePic: "", userRating: "", totalRating: "", averageRating: ""));
      //   }
      // }
      //
      
      isloading = false;
      notifyListeners();
    } else {
      isloading = true;
      notifyListeners();
    }
  }

bool ratingloading=false;
  HitRatting(String id, String ratting, BuildContext context) async {
    // isloading = true;
    //here timer//
    ratingloading=true;
    notifyListeners();
    bool rating = await AddRatingService.AddRattingNow(
        id: id, ratting: ratting, context: context);
    if (rating) {
      print("Ratting done");
      //fluttertoast("Ratting Updated Successfully");
      ratingloading=false;
      notifyListeners();
    } else {
      ratingloading=false;
      notifyListeners();
    }
  }
}
