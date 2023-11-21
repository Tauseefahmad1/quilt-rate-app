import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Components/single_message.dart';
import 'package:rate_my_quilt/Controller/Chat_Controller.dart';
import 'package:rate_my_quilt/Model/ChatModel.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class ChatScreen extends StatelessWidget {
  String chatid, title, imageurl;

  ChatScreen(
      {required this.chatid,
      required this.title,
      required this.imageurl,
      super.key});

  @override
  Widget build(BuildContext context) {
    final chatcontroller = Provider.of<Chat_Controller>(context, listen: false);
    chatcontroller.getchat(context, chatid);
    return Scaffold(
        backgroundColor: Color(0XFFedc7e5),
        appBar: PreferredSize(
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: whitecolor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                child: Center(
                    child: CommonAppBar2(
                  subtitle: "Online",
                  title: title,
                  profileurl: imageurl,
                ))),
            preferredSize: Size(width(context), 1300)),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<Chat_Controller>(
                builder: (context, controller, child) {
                  if ((chatcontroller.chats!.data).toString()=="null") {
                    return CircularProgressIndicator();
                  }
                  //if (controller.isloading == false) {
                    return SizedBox(
                      height: height(context) * .69,
                      child: ListView.builder(
                          itemCount: chatcontroller.chats!.data.length,
                          reverse: true,
                          physics: const ScrollPhysics(),
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            print("myid" + myid);
                            return SingleMessage(
                              chat: ChatModel(
                                  message:
                                      chatcontroller.chats!.data[index].message,
                                  time: "02:00",
                                  isme: chatcontroller
                                              .chats!.data[index].senderUserId ==
                                          myid
                                      ? true
                                      : false),
                            );
                          }),
                    );
                   //} 
        
                  //else {
                   // return Container();
                  //}
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTextField3(
                        ontap: () {
                          chatcontroller.postchat(context, chatid);
                        },
                        hinttext: "Write a message ...",
                        controller: chatcontroller.controller,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
