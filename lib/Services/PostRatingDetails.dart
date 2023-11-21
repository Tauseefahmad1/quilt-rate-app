import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Model/PostRattingModel.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/View/Auth/Login.dart';

class GetPostratting {
  static Future getpostrattingNow({required BuildContext context,required int postid,}) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('GET', Uri.parse('https://ratemyquilts.com/api/rating_users?post_id=$postid'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
          return postRattingModelFromJson(responseBody);
        } else {
          return false;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Thing Went Wrong")));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {}
  }}