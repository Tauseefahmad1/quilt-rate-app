import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/GetChatModel.dart';
import 'package:rate_my_quilt/Model/NotificationModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Utils/Functions.dart';

class NotificationService {
  static getServiceNow({
    required BuildContext context,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('GET',
          Uri.parse('https://ratemyquilts.com/api/user_notifications'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          print(mapBody["data"].toString() + "ilsjdlksjclksjlskc");
          return notificationModelFromJson(responseBody);
        } else {
          return false;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
        return false;
      }
    } catch (e) {}
  }
}
