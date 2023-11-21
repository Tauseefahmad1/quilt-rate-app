import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/UserChatsModel.dart';
import 'package:rate_my_quilt/Services/UserChatsService.dart';

class Message_Controller extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginformKey = GlobalKey();
  bool isloading = false;
  UserChatsModel? userchatmodel;
  Hitmessages(BuildContext context) async {
    isloading = true;
        notifyListeners();
        var res = await UserChatService.ChatlistNow(context: context);
        if (res is UserChatsModel) {
          userchatmodel = res;
          isloading = false;
          notifyListeners();
          if (userchatmodel!.status == 200) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text(userchatmodel!.message.toString())));
          }
        } else {
          isloading = false;
          notifyListeners();
        }
  
  }
}
