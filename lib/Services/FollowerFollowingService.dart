import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Model/FollowerFollowingModel.dart';
import 'package:rate_my_quilt/Model/GetPostsModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';

class FollowerFollowingService {
  static Future userFollowing(
      {required BuildContext context, required int userid}) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://ratemyquilts.com/api/user_followings?user_id=$userid'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return followerFollowingModelFromJson(responseBody);
        } else {
          return false;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
      }
    } catch (e) {}
  }



    static Future userFollower(
      {required BuildContext context, required int userid}) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://ratemyquilts.com/api/user_followers?user_id=$userid'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return followerFollowingModelFromJson(responseBody);
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
