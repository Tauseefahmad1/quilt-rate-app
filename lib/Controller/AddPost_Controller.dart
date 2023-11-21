import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Services/AddPostService.dart';

class AddPost_Controller extends ChangeNotifier {
  TextEditingController title = TextEditingController();
  GlobalKey<FormState> addpostformKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? selectdFile;

  pickimage({required ImageSource source}) async {
    image = await _picker.pickImage(source: source);
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

  //
  bool isloading = false;
  Hitaddquitling(BuildContext context) async {
    if (addpostformKey.currentState!.validate() && selectdFile != null) {
      {
        isloading = true;
        notifyListeners();
        bool isadd = await AddPostService.AddPostNow(
            title: title.text.toString(),
            image: selectdFile!.path,
            context: context);
        if (isadd) {
          title.clear();
          selectdFile!.delete();
          isloading = false;
          notifyListeners();
          Navigator.pop(context);
        } else {
          title.clear();
          selectdFile!.delete();
          selectdFile = null;
          isloading = false;
          notifyListeners();
        }
      }
    }
  }
}
