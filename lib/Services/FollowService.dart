import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;

class FollowService {
  static Future FollowNow({
    required String userid,
    required BuildContext context,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(userprofileurl));
      request.fields.addAll({'followed_user_id': userid});
      var headers = {'Authorization': 'Bearer $token'};
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
