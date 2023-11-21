import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;

class SignupService {
  static Future SignupNow({
    required String username,
    required String email,
    required String password,
    required String confirmpassword,
    required String profilepic,
    required BuildContext context,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(signupurl));
      //
      if (profilepic=="null") {
      request.fields.addAll({
        'full_name': username,
        'email': email,
        'password': password,
        'confirm_password': confirmpassword,
        'profile_pic':"null"
      });
      } else {
        request.fields.addAll({
        'full_name': username,
        'email': email,
        'password': password,
        'confirm_password': confirmpassword,
        'profile_pic':profilepic
      });
      request.files.add(await http.MultipartFile.fromPath('profile_pic', profilepic));
      }
      //
      
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {  
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return true;
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
