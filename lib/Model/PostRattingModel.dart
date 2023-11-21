// To parse this JSON data, do
//
//     final postRattingModel = postRattingModelFromJson(jsonString);

import 'dart:convert';

PostRattingModel postRattingModelFromJson(String str) => PostRattingModel.fromJson(json.decode(str));

String postRattingModelToJson(PostRattingModel data) => json.encode(data.toJson());

class PostRattingModel {
    PostRattingModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory PostRattingModel.fromJson(Map<String, dynamic> json) => PostRattingModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.postId,
        required this.rating,
        required this.updatedAt,
        required this.userId,
        required this.fullName,
        required this.profilePic,
    });

    String postId;
    String rating;
    DateTime updatedAt;
    String userId;
    String fullName;
    String profilePic;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        postId: json["post_id"],
        rating: json["rating"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "post_id": postId,
        "rating": rating,
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "full_name": fullName,
        "profile_pic": profilePic,
    };
}
