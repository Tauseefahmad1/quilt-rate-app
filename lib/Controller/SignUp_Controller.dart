import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rate_my_quilt/Services/SignupService.dart';

class SignUp_Controller extends ChangeNotifier {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> signupformKey = GlobalKey();
  bool isloading = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? selectdFile;
  pickimage({required ImageSource source}) async {
    image = await _picker.pickImage(source: source);//ImageSource.gallery);
    if(image !=null){
      image=await _cropimage(imagefile:image!);
      selectdFile=File(image!.path);
    }
    notifyListeners();
  }
  _cropimage({required XFile imagefile})async{
CroppedFile? croppedfile=await ImageCropper().cropImage(sourcePath: imagefile.path,aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4));
if (croppedfile==null) {
  return null;
} else {
  return XFile(croppedfile.path);
}
  }
  HitSignup(BuildContext context) async {
    if (signupformKey.currentState!.validate()) {
      {
        if (password.text.toString() == confirmpassword.text.toString()) {
           isloading = true;
           notifyListeners();
           print("sdfdsf"+selectdFile.toString());
          var res = await SignupService.SignupNow(
              username: fullname.text.toString(),
              email: email.text.toString(),
              password: password.text.toString(),
              confirmpassword: confirmpassword.text.toString(),
              profilepic:selectdFile.toString()=="null"? "null":selectdFile!.path.toString(),
              context: context);
          if (res == true) {
             isloading = false;
           notifyListeners();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registered Successfully")));
            Navigator.pop(context);
          } else {
             isloading = false;
           notifyListeners();
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Password Didn't Match")));
        }
      }
    }
  }
}
