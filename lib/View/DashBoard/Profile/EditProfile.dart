import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/Setting_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {

        final settingcontroller =
    Provider.of<Setting_Controller>(context, listen: false);
    return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
                      index: 3,
                    ),
      backgroundColor: pageBackgroundColor,
      appBar: PreferredSize(
          child: CommonAppBar(
            subtitle: "Profile",
            title: "Edir",
          ),
          preferredSize: Size(width(context), 60)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: settingcontroller.editformKey,
          child: Column(
            children: [
              30.sh,
              Stack(
                    children: [
                      Consumer<Setting_Controller>(
                          builder: (context, controller, child) {
                        if (controller.image == null) {
                          return ClipOval(
                            child: Image.asset(
                              blackandwhiteapplicationicon,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        } else {
                          return CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(
                                controller.selectdFile!,
                              ));
                        }
                      }),
                      Positioned(
                          right: 5,
                          bottom: 5,
                          child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: CommonTextmeri(
                                            text: "Select Image Source",
                                            fontweight: FontWeight.w500,
                                            fontsize: 15,
                                            color: primaryColor),
                                        content: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 13, horizontal: 20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: whitecolor),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: primaryColor),
                                                  onPressed: () { 
                                                    settingcontroller.pickimage(
                                                      source: ImageSource.gallery,
                                                    );
                                                  Navigator.pop(context);
                                                  },
                                                  child: CommonTextmeri(
                                                      text: "Gallary",
                                                      fontweight: FontWeight.w400,
                                                      fontsize: 15,
                                                      color: whitecolor),
                                                ),
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: primaryColor),
                                                  onPressed: () {
                                                    settingcontroller.pickimage(
                                                      source: ImageSource.camera,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  child: CommonTextmeri(
                                                      text: "Camera",
                                                      fontweight: FontWeight.w400,
                                                      fontsize: 15,
                                                      color: whitecolor),
                                                ),
                                              ],
                                            )),
                                      );
                                    });
                              },
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: Center(
                                      child: Icon(
                                    CupertinoIcons.camera_fill,
                                    color: whitecolor,
                                    size: 15,
                                  )))))
                    ],
                  ),
                  30.sh,
                  CommonTextField4(
                    hinttext: "Full Name",
                    controller: settingcontroller.fullname,
                    maxlines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Full Name";
                      }
                    },
                  ),
                  14.sh,
                  CommonTextField4(
                    hinttext: "About Me",
                    controller: settingcontroller.aboutme,
                   maxlines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter About Me";
                      }
                    },
                  ),
                  
                  14.sh,
                  // CommonTextField(
                  //   hinttext: "Email",
                  //   controller: settingcontroller.email,
                  //   prefixicon: attherateicon,
                  //   enable: false,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Enter your Email";
                  //     } else if (!RegExp(
                  //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //         .hasMatch(value!)) {
                  //       return "Email is not valid";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                  14.sh,
                 Consumer<Setting_Controller>(
                   builder: (context, controller, child) {
                     if (controller.isloading) {
                       return CircularProgressIndicator();
                     } else {
                       return CommonButton2(
                    title: "Update",
                    ontap: () async {
                    await settingcontroller.hitEditProfile(context);
                    });
                     }
                   },
                 )
                  
            ],
          ),
        ),
      ),
    );
  }
}
