import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Controller/ForgotPassword_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class ForgotPassword extends StatelessWidget {
 const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordController =
        Provider.of<ForgotPassword_Controller>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: forgotPasswordController.forgotpasswordformKey,
          child: Column(
            children: [
              SafeArea(
                  child: Container(
                height: height(context) * .10,
              )),
              Image.asset(
                logo,width: 180,height: 180,
              ),
              30.sh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CommonTextOpen(
                    text: "Don’t Worry . We can get you back.",
                    fontweight: FontWeight.w400,
                    fontsize: 18,
                    color: greycolor,
                    talign: TextAlign.center),
              ),
              100.sh,
              CommonTextField(
                  hinttext: "Email",
                  controller: forgotPasswordController.email,
                  prefixicon: attherateicon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                  },
                  ),
              50.sh,
              CommonButton(
                  title: "Reset Password",
                  ontap: () {
                    forgotPasswordController.HitForgotPassword(context);
                  }),
              90.sh,
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Remembered Password ? ',
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