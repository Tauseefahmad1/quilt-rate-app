import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;

class ChangePasswordService {
  static Future changepasswordNow({
    required String currentpassword,
    required String newpassword,
    required String confirmpassword,
    required BuildContext context,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST',
          Uri.parse('https://ratemyquilts.com/api/update_password'));
      request.fields.addAll({
        'current_password': currentpassword,
        'new_password': newpassword,
        'confirm_password': confirmpassword
      });

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
