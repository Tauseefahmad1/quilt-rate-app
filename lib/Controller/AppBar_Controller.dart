import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Services/IsNotificationAvaliableService.dart';

class AppBar_Controller extends ChangeNotifier {
  bool havnotification = false;
  Hitisnotified(BuildContext context) async {
    try {
      var res =
         await IsNotificationAvaliableService.getisnotifiednow(context: context);
      if (res == "true") {
        havnotification=true;
        notifyListeners();
      } else if (res == "false") {
        havnotification=false;
        notifyListeners();
      } else {}
    } catch (e) {}
  }
}
