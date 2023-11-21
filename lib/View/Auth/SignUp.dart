import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Controller/SignUp_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController =
        Provider.of<SignUp_Controller>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentcolor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        automaticallyImplyLeading: false,
        title: CommonTextmeri(
            text: "Sign Up",
            fontweight: FontWeight.w700,
            fontsize: 24,
            color: primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: SignupController.signupformKey,
          child: Column(
            children: [
              SafeArea(child: Container()),
              CommonTextmeri(
                  text: "Please enter your details to sign up",
                  fontweight: FontWeight.w400,
                  fontsize: 16,
                  color: secondryColor),
                  20.sh,
              Stack(
                children: [
                  Consumer<SignUp_Controller>(
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
                                        padding: const EdgeInsets.symmetric(
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
                                                  backgroundColor: primaryColor),
                                              onPressed: () {
                                                SignupController.pickimage(
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
                                                  backgroundColor: primaryColor),
                                              onPressed: () {
                                                SignupController.pickimage(
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
              CommonTextField(
                hinttext: "Full Name",
                controller: SignupController.fullname,
                prefixicon: personicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Full Name";
                  }
                },
              ),
              14.sh,
              CommonTextField(
                hinttext: "Email",
                controller: SignupController.email,
                prefixicon: attherateicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your Email";
                  } else if (!RegExp(
                          r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return "Email is not valid";
                  } else {
                    return null;
                  }
                },
              ),
              14.sh,
              CommonTextField(
                hinttext: "Password",
                controller: SignupController.password,
                obsecure: true,
                prefixicon: lockicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  } else if (value!.length <= 8) {
                    return "Enter 8 Character Password";
                  }
                },
              ),
              14.sh,
              CommonTextField(
                hinttext: "Confirm Password",
                controller: SignupController.confirmpassword,
                obsecure: true,
                prefixicon: lockicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Confirm Password";
                  } else if (value!.length <= 8) {
                    return "Enter 8 Character Confirm Password";
                  }
                },
              ),
              30.sh,
              Consumer<SignUp_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CommonButton(
                        title: "Register",
                        ontap: () {
                          SignupController.HitSignup(context);
                        });
                  }
                },
              ),
              30.sh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(5, 5),
                                color: greycolor.withOpacity(.1),
                                blurRadius: 20,
                                spreadRadius: 1),
                            BoxShadow(
                                offset: const Offset(-5, -5),
                                color: greycolor.withOpacity(.1),
                                blurRadius: 20,
                                spreadRadius: 1),
                          ],
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        googleicon,
                        height: 24,
                        width: 24,
                      )),
                  27.sw,
                  Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(5, 5),
                                color: greycolor.withOpacity(.1),
                                blurRadius: 20,
                                spreadRadius: 1),
                            BoxShadow(
                                offset: const Offset(-5, -5),
                                color: greycolor.withOpacity(.1),
                                blurRadius: 20,
                                spreadRadius: 1),
                          ],
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        facebookicon,
                        height: 24,
                        width: 24,
                      )),
                ],
              ),
              20.sh,
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Have an account? ',
                          style: TextStyle(
                              color: Color(0XFF828282),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: Color(0XFF38972E),
                              fontSize: 16,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
              20.sh,
            ],
          ),
        ),
      ),
    );
  }
}
