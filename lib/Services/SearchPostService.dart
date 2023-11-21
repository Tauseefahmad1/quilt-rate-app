import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Model/LoginModel.dart';
import 'package:rate_my_quilt/Model/MyProfileModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;

class SearchPostService {
  static Future searchpostNow({
    required String title,
    required BuildContext context,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://ratemyquilts.com/api/searched_posts?title=$title'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return getPostsModelFromJson(responseBody);
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
