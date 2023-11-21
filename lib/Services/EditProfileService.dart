import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;

class EditProfileService {
  static Future EditNow({
    required String fullname,
    required String aboutme,
    required String profile,
    required BuildContext context,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://ratemyquilts.com/api/update_profile'));
      if (profile=="null") {
      request.fields.addAll({
        'full_name': fullname,
        'about_me': aboutme,
        'profile_pic': "null"
      });  
      } else {
        request.fields.addAll({
        'full_name': fullname,
        'about_me': aboutme,
      });
      request.files
          .add(await http.MultipartFile.fromPath('profile_pic', profile));
      }
      
      
      
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return true;
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
