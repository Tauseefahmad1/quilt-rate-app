import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/LoginModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Utils/Functions.dart';

class SocialLoginService {
  static Future loginNow({
    required var username,
    required var email,
    required var logintype,
    required BuildContext context,
  }) async {
    try {
      await firebasegetfcmtoken();
      var request = http.MultipartRequest('POST', Uri.parse('https://ratemyquilts.com/api/social_login'));
request.fields.addAll({
  'email': email,
  'password': '12345678',
  'login_type': logintype,
  'full_name': username,
  'fcm_token': fcmtoken!
});


http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      
      if (response.statusCode == 200) {  
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return loginModelFromJson(responseBody);
        } else if (mapBody["status"] == 600) {
          return "600";
        } else {
          return false;
        }
      }else{ 
        ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
      }
    } catch (e) {}
  }
}