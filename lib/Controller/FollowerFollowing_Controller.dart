import 'package:flutter/cupertino.dart';
import 'package:rate_my_quilt/Model/FollowerFollowingModel.dart';
import 'package:rate_my_quilt/Services/FollowerFollowingService.dart';

class FollowerFollowing_Controller extends ChangeNotifier{
  bool isloading=false;
  FollowerFollowingModel? responsemodel;
  List<Datum>? searchlist = [];
  
  TextEditingController searchcontroller=TextEditingController();
  hitupdate(){
    notifyListeners();
  }
  hitfollowing(BuildContext context,int userid) async {
    isloading = true;
    notifyListeners();
    var res = await FollowerFollowingService.userFollowing(context: context, userid: userid);
    if (res is FollowerFollowingModel) {
      responsemodel = res;
      isloading = false;
      notifyListeners();
    } else {
      isloading = false;
      notifyListeners();
    }
  }


  hitfollower(BuildContext context,int userid) async {
    isloading = true;
    notifyListeners();
    var res = await FollowerFollowingService.userFollower(context: context, userid: userid);
    if (res is FollowerFollowingModel) {
      responsemodel = res;
      isloading = false;
      notifyListeners();
    } else {
      isloading = false;
      notifyListeners();
    }
  }
}