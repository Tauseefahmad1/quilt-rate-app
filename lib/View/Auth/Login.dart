import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Controller/Login_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/Auth/ForgotPassword.dart';
import 'package:rate_my_quilt/View/Auth/SignUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController =
        Provider.of<Login_Controller>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: loginController.loginformKey,
          child: Column(
            children: [
              SizedBox(
                height: height(context) * .12,
              ),
              Image.asset(logo,width: 200,height: 175,fit: BoxFit.cover),
              30.sh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CommonTextOpen(
                    text: "Rate My Quilt",
                    fontweight: FontWeight.w400,
                    fontsize: 18,
                    color: greycolor,
                    talign: TextAlign.center),
              ),
              30.sh,
              CommonTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your Email";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return "Email is not valid";
                    } else {
                      return null;
                    }
                  },
                  hinttext: "Email",
                  controller: loginController.email,
                  prefixicon: attherateicon),
              14.sh,
              CommonTextField(
                hinttext: "Password",
                controller: loginController.password,
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
              9.sh,
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    //Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTopPop, child: ForgotPassword(), childCurrent: this));
                    Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 300),
                                      child: ForgotPassword(
                                      )));
                  },
                  child: CommonTextOpen(
                      text: "Forget Password?",
                      fontweight: FontWeight.w400,
                      fontsize: 18,
                      color: const Color(0XFF828282),
                      talign: TextAlign.right),
                ),
              ),
              30.sh,
              Consumer<Login_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CommonButton(
                        title: "Login",
                        ontap: () {
                          loginController.HitLogin(context);
                        });
                  }
                },
              ),
              //
              30.sh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                       await googlelogin(context: context);
                    },
                    child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: greycolor.withOpacity(.1),
                                  blurRadius: 20,
                                  spreadRadius: 1),
                              BoxShadow(
                                  offset: Offset(-5, -5),
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
                  ),
                  27.sw,
                  InkWell(
                    onTap: () async {
                      // final result = await FacebookAuth.i
                      //     .login(permissions: ["public_profile", "email"]);
                      // if (result.status == LoginStatus.success) {
                      //   final userData = await FacebookAuth.i
                      //       .getUserData(fields: "email,name,picture");
                      //   if (userData != null) {
                      //     // controller.writeStorage(Keys.email, userData["email"]);
                      //     // controller.writeStorage(Keys.id, userData["id"]);

                      //     // controller.writeStorage(Keys.username, userData["name"]);
                      //     // controller.writeStorage(
                      //     //     Keys.token, result.accessToken!.token.toString());

                      //     // controller.writeStorage(Keys.pictureurl,
                      //     //     userData["picture"]["data"]["url"].toString());
                      //     // print(userData["picture"]["data"]["url"]);
                      //     // print(controller.readStorage(Keys.email));
                      //     // print(controller.readStorage(Keys.id));
                      //     // print(controller.readStorage(Keys.username));
                      //     // print(controller.readStorage(Keys.token));

                      //   //  Get.offAll(() => HomeScreen());
                      //   }
                      //   // setState(() {
                      //   //   _userData = userData;
                      //   // });
                      // }
                     // fluttertoast("Some Thing Went Wrong From FaceBook");
                    },
                    child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: greycolor.withOpacity(.1),
                                  blurRadius: 20,
                                  spreadRadius: 1),
                              BoxShadow(
                                  offset: Offset(-5, -5),
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
                  ),
                ],
              ),
              20.sh,
              InkWell(
                onTap: () {
                  Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 300),
                                      child: SignUp(
                                      )));
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
                          text: 'Register',
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
