import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/NotificationModel.dart';
import 'package:rate_my_quilt/Services/NotificationService.dart';

class Notification_Controller extends ChangeNotifier{
  bool isloading=false;
  NotificationModel? notificationModel;

Hitnotification(BuildContext context) async {
    isloading = true;
        notifyListeners();
        var res = await NotificationService.getServiceNow(context: context);
        if (res is NotificationModel) {
          notificationModel = res;
          isloading = false;
          notifyListeners();
          if (notificationModel!.status == 200) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text(notificationModel!.message.toString())));
          }
        } else {
          isloading = false;
          notifyListeners();
        }
  
  }
}