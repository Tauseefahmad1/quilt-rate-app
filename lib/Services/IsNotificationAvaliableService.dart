import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Utils/Constants.dart';

class IsNotificationAvaliableService {
  static Future getisnotifiednow({required BuildContext context}) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://ratemyquilts.com/api/is_notifications_available'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return mapBody["data"].toString();
        } else {
          return "null";
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
       }
    } catch (e) {}
  }
}
