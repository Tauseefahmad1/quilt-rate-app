import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/ChatUsersWidget.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/AppBar_Controller.dart';
import 'package:rate_my_quilt/Controller/Message_Controller.dart';
import 'package:rate_my_quilt/Model/ChatUserModel.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Messages/ChatScreen.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final messagepagecontroller =
        Provider.of<Message_Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await messagepagecontroller.Hitmessages(context);
    });
context.read<AppBar_Controller>().Hitisnotified(context);
    // messagepagecontroller.Hitmessages(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: 2,
      ),
        backgroundColor: pageBackgroundColor,
        appBar: PreferredSize(
            child: CommonAppBar(
              subtitle: "Screen",
              title: "Chat",
            ),
            preferredSize: Size(width(context), 60)),
        body: SizedBox(
          height: height(context),
          child: SingleChildScrollView(
            child: Consumer<Message_Controller>(
              builder: (context, controller, child) {
                if (controller.isloading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (controller.userchatmodel == null) {
                    return Container();
                  }

                  return Column(
                    children: [
                      20.sh,
                      controller.userchatmodel!.data.length > 0
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.userchatmodel!.data.length,
                              itemBuilder: (BuildContext context, index) {
                                return ChatUsersWidget(
                                    ontap: () {
                                      //checkcheck

                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: ChatScreen(
                                                title: controller.userchatmodel!
                                                    .data[index].fullName,
                                                imageurl: controller
                                                    .userchatmodel!
                                                    .data[index]
                                                    .profilePic,
                                                chatid: controller
                                                    .userchatmodel!
                                                    .data[index]
                                                    .id,
                                              )));
                                    },
                                    chatUserModel: ChatUserModel(
                                        title: controller
                                            .userchatmodel!.data[index].fullName
                                            .toString(),
                                        subtitle: controller.userchatmodel!
                                            .data[index].lastMessage
                                            .toString(),
                                        imageurl: controller.userchatmodel!
                                            .data[index].profilePic
                                            .toString(),
                                        time: "02:39 PM"));
                              })
                          : Center(
                              child: Text("No Messages Found"),
                            ),
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }
}
