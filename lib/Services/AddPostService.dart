import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:rate_my_quilt/Utils/Functions.dart';

class AddPostService {
  static AddPostNow({
    required String title,
    required String image,
    required BuildContext context,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(addpostsurl));
      request.fields.addAll({'title': title});
      request.files.add(await http.MultipartFile.fromPath('image', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map mapBody = jsonDecode(responseBody);
        if (mapBody["status"] == 200) {
         // fluttertoast("Post Add Successfully");
          return true;
        } else if (mapBody["status"] == 600) {
          return "600";
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
