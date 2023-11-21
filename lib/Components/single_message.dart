import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Model/ChatModel.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class SingleMessage extends StatelessWidget {
  // final String message;
  // final bool isMe;
  ChatModel chat;
  SingleMessage({
    required this.chat,
    // required this.message,
    // required this.isMe,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat.isme ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            constraints: BoxConstraints(maxWidth: 200),
            decoration: BoxDecoration(
                color: chat.isme ? Color(0XFFE4F4FF) : whitecolor,
                borderRadius: chat.isme
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                    : BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  chat.isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  chat.message,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                3.sh,
                CommonTextmeri(
                    text: chat.time,
                    talign: TextAlign.right,
                    fontweight: FontWeight.w400,
                    fontsize: 10,
                    color: Color(0XFF6A5E5EA8)),
              ],
            )),
      ],
    );
  }
}
