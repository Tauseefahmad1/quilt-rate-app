import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Controller/AddPost_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    final addPostController =
        Provider.of<AddPost_Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: addPostController.addpostformKey,
          child: Column(
            children: [
              SizedBox(
                height: height(context) * .02,
              ),
              Consumer<AddPost_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return Center(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.withOpacity(.5),
                        valueColor: AlwaysStoppedAnimation(primaryColor),
                        minHeight: 5,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: height(context) * .02,
              ),
              InkWell(
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
                                  borderRadius: BorderRadius.circular(6),
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
                                      addPostController.pickimage(
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
                                      addPostController.pickimage(
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

                  //addPostController.pickimage();
                },
                child: Container(
                    height: height(context) * .6,
                    width: width(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade400.withOpacity(.4)),
                    child: Consumer<AddPost_Controller>(
                      builder: (context, controller, child) {
                        if (controller.image == null) {
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonTextpopp(
                                    text: "Attach Photo",
                                    fontweight: FontWeight.w500,
                                    fontsize: 28,
                                    color: Color(0XFF455A64)),
                                Image.asset(uploadicon),
                              ],
                            ),
                          );
                        } else {
                          return Image.file(
                            controller.selectdFile!,
                            fit: BoxFit.fill,
                          );
                        }
                      },
                    )),
              ),
              40.sh,
              CommonTextField2(
                hinttext: "Write title here ....",
                controller: addPostController.title,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter title here";
                  }
                },
              ),
              20.sh,
              Consumer<AddPost_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return Container();
                  } else {
                    return CommonButton2(
                        title: "Post",
                        ontap: () {
                          controller.Hitaddquitling(context);
                        });
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
