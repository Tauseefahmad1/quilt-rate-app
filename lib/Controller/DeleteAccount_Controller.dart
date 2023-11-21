import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Services/DeleteAccountService.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class DeleteAccount_Controller extends ChangeNotifier {
  bool isloading = false;

  Hitdelete(BuildContext context) async {
    isloading = true;
    notifyListeners();
    bool delete = await DeleteAccountService.deleteNow(context: context);
    if (delete) {
      //fluttertoast("Account Delete Successfully");
      isloading = false;
      notifyListeners();
    } else {
      isloading = true;
      notifyListeners();
    }
  }
}
