import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Model/ChatModel.dart';
import 'package:rate_my_quilt/Model/GetChatModel.dart';
import 'package:rate_my_quilt/Services/GetMessageService.dart';
import 'package:rate_my_quilt/Services/SendMessageService.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class Chat_Controller extends ChangeNotifier {
  GetChatModel? chats;
  bool isloading = false;
  TextEditingController controller = TextEditingController();
  getchat(BuildContext context, String id) async {
    isloading = true;
    notifyListeners();
    var list = await GetMessageService.getmessageNow(
        chatid: id.toString(), context: context);

    if (list is GetChatModel) {
      chats = list;
      isloading = false;
      notifyListeners();
      if (chats!.status == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(chats!.message.toString())));
      } else {
        isloading = false;
        notifyListeners();
      }
    }
    // Timer(Duration(seconds: 10), () {
    //   getchat(context, id);
    // });
  }

  postchat(
    BuildContext context,
    String chatid,
  ) async {
    var res = await SendMessageService.sendmessageNow(
        chatid: chatid, message: controller.text.toString(), context: context);
    controller.clear();
    if (res == true) {
     // fluttertoast("Message Send");
    } else {}
  }

  @override
  void dispose() {
    chatlist;
    super.dispose();
  }
}
