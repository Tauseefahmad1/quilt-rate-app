import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Components/CommonButton.dart';
import 'package:rate_my_quilt/Components/CommonTextField.dart';
import 'package:rate_my_quilt/Controller/Setting_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
            subtitle: "Password",
            title: "Change",
          ),
          preferredSize: Size(width(context), 60)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: settingcontroller.changepasswordformKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              20.sh,
              CommonTextField(
                hinttext: "Enter Current Password",
                controller: settingcontroller.curpassword,
                prefixicon: lockicon,
                obsecure: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Current Password";
                  } else if (value.length < 8) {
                    return "Password must be 8 characters";
                  }
                },
              ),
              20.sh,
              CommonTextField(
                obsecure: true,
                hinttext: "Enter New Password",
                controller: settingcontroller.newpassword,
                prefixicon: lockicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter New Password";
                  } else if (value.length < 8) {
                    return "Password must be 8 characters";
                  }
                },
              ),
              20.sh,
              CommonTextField(
                obsecure: true,
                hinttext: "Confirm Password",
                controller: settingcontroller.confirmpassword,
                prefixicon: lockicon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Confirm Password";
                  } else if (value.length < 8) {
                    return "Password must be 8 characters";
                  }else if(settingcontroller.confirmpassword.text != settingcontroller.newpassword.text){
                    return "Password didn't match";
                  }
                },
              ),
              20.sh,
              Consumer<Setting_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return CircularProgressIndicator();
                  } else {
                   return CommonButton2(
                  title: "Change Password",
                  ontap: () async {
                    await settingcontroller.hitChangePassword(context);
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
