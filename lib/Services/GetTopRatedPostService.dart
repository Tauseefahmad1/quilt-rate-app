import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';

class GetTopRatedPostService {
  static Future getpostNow({required BuildContext context}) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('GET', Uri.parse(topatedpost));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return getPostsModelFromJson(responseBody);
        } else if (mapBody["status"] == 600) {
          return "600";
        } else {
          return false;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {}
  }
}
