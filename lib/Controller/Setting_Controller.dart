import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rate_my_quilt/Services/ChangePasswordService.dart';
import 'package:rate_my_quilt/Services/EditProfileService.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';

class Setting_Controller extends ChangeNotifier {
  TextEditingController curpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController aboutme = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController fullname = TextEditingController(text: user_name);
  TextEditingController email = TextEditingController(text: e_mail);
  GlobalKey<FormState> editformKey = GlobalKey();
  GlobalKey<FormState> changepasswordformKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? selectdFile;
  pickimage({required ImageSource source}) async {
    image = await _picker.pickImage(source: source); //ImageSource.gallery);
    if (image != null) {
      image = await _cropimage(imagefile: image!);
      selectdFile = File(image!.path);
    }
    notifyListeners();
  }

  _cropimage({required XFile imagefile}) async {
    CroppedFile? croppedfile = await ImageCropper().cropImage(
        sourcePath: imagefile.path,
        aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4));
    if (croppedfile == null) {
      return null;
    } else {
      return XFile(croppedfile.path);
    }
  }

  bool isloading = false;
  hitEditProfile(BuildContext context) async {
    if (editformKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();
      bool res = await EditProfileService.EditNow(
          fullname: fullname.text.toString(),
          aboutme: aboutme.text.toString(),
          profile: selectdFile.toString() == "null"
              ? selectdFile.toString()
              : selectdFile!.path.toString(),
          context: context);
      if (res) {
        isloading = false;
        notifyListeners();
        Navigator.pop(context);
        //fluttertoast("Profile Edit Successfully");
      } else {
        isloading = false;
        notifyListeners();
      }
    }
  }

  hitChangePassword(BuildContext context) async{
    if (changepasswordformKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();
      bool res = await ChangePasswordService.changepasswordNow(currentpassword: curpassword.text, newpassword: newpassword.text, confirmpassword: confirmpassword.text, context: context);
      if (res) {
        isloading = false;
        notifyListeners();
        Navigator.pop(context);
       // fluttertoast("Password Change Successfully");
      } else {
        isloading = false;
        notifyListeners();
      }
    }
  }
}
