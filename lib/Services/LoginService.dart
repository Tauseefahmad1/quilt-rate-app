import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/LoginModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Utils/Functions.dart';

class LoginService {
  static Future loginNow({
    required var username,
    required var password,
    required BuildContext context,
  }) async {
    try {
      //bool internet=await checkInternetConnectivity();
// if (!internet) {
//   print("internet");
//   showDialog(
//             context: context,
//             builder: (context) {
//               return InternetConnectivityDialogBox();
//             });
// }
      await firebasegetfcmtoken();
      var request = http.MultipartRequest('POST', Uri.parse(loginurl));
      request.fields.addAll(
          {'email': username, 'password': password, 'fcm_token': fcmtoken!});
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return loginModelFromJson(responseBody);
        } else {
          return false;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
      }
    } catch (e) {}
  }
}
