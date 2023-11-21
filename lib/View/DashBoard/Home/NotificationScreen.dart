import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/ChatUsersWidget.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/Notification_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationcontroller =
        Provider.of<Notification_Controller>(context, listen: false);
    notificationcontroller.Hitnotification(context);
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          index: 0,
        ),
        backgroundColor: pageBackgroundColor,
        appBar: PreferredSize(
            child: CommonAppBar(
              subtitle: "Screen",
              title: "Notification",
            ),
            preferredSize: Size(width(context), 60)),
        body: SizedBox(
          height: height(context),
          child: SingleChildScrollView(
            child: Consumer<Notification_Controller>(
              builder: (context, controller, child) {
                if (controller.notificationModel == null) {
                  return Container();
                }
                if (controller.isloading) {
                  print(controller.notificationModel!.data.toString());
                  return Center(child: CircularProgressIndicator());
                } else {
                  print(controller.notificationModel!.data.toString());
                  return Column(
                    children: [
                      30.sh,
                      controller.notificationModel!.data.length > 0
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.notificationModel!.data.length,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: ListTile(
                                    tileColor: greycolor.withOpacity(.1),
                                    leading: SvgPicture.asset(notificationicon),
                                    title: Text(controller.notificationModel!
                                        .data[index].notification
                                        .toString()),
                                  ),
                                );
                              })
                          : Center(
                              child: Text("There is no notification"),
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
