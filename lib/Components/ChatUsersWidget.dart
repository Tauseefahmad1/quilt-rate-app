import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Model/ChatUserModel.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class ChatUsersWidget extends StatelessWidget {
  ChatUserModel chatUserModel;
  var ontap;
  ChatUsersWidget({super.key, required this.chatUserModel,required this.ontap});

  @override
  Widget build(BuildContext context) {
    print(chatUserModel.imageurl.toString());
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: whitecolor,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Center(
        child: ListTile(
          onTap: ontap,
          title: CommonTextmeri(
              text: chatUserModel.title,
              fontweight: FontWeight.w700,
              talign: TextAlign.left,
              fontsize: 14,
              color: Color(0XFF1F272E)),
          subtitle: CommonTextOpen(
              text: chatUserModel.subtitle,
              fontweight: FontWeight.w600,
              talign: TextAlign.left,
              fontsize: 12,
              color: Color(0XFF455A64)),
          leading: CircleAvatar(
            radius: 20,
            // child: Image.network(
            //   chatUserModel.imageurl=="default.png" ?"https://img.freepik.com/free-photo/beautiful-shot-tree-savanna-plains-with-blue-sky_181624-21992.jpg?w=996&t=st=1678795324~exp=1678795924~hmac=c2863eacf55a848349aa1ac356818f98042b23f722fdaa68f5184e7cb57f5e15" :
            //   chatUserModel.imageurl,
            // ),
            backgroundImage: NetworkImage(
              chatUserModel.imageurl=="default.png" ?"https://freesvg.org/img/abstract-user-flat-4.png" :
              chatUserModel.imageurl,
            ),
          ),
          trailing: Column(
            children: [
              10.sh,
              CommonTextmeri(
                  text: chatUserModel.time,
                  fontweight: FontWeight.w400,
                  talign: TextAlign.left,
                  fontsize: 11,
                  color: Color(0XFF6A5E5EA8).withOpacity(.65)),
            ],
          ),
        ),
      ),
    );
  }
}
