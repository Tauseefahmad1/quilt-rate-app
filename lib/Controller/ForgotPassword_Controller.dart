import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class ForgotPassword_Controller extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> forgotpasswordformKey = GlobalKey();

  HitForgotPassword(BuildContext context) {
    if (forgotpasswordformKey.currentState!.validate()) {
      {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialogBox(title: email.text.toString());
            });
      }
    }
  }
}
