

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/PostRattingModel.dart';
import 'package:rate_my_quilt/Services/PostRatingDetails.dart';

class PostRatting_Controller extends ChangeNotifier{
 PostRattingModel? postrattingmodel;
 bool isloading=false;
  hitpostratting(BuildContext context,int postid) async {
        isloading = true;
        notifyListeners();
        var res = await GetPostratting.getpostrattingNow(context: context, postid: postid);
        if (res is PostRattingModel) {
          postrattingmodel = res;
          isloading = false;
          notifyListeners();
        } else {
          isloading = false;
          notifyListeners();
        }
      
  }
  
}