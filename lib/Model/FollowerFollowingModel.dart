// To parse this JSON data, do
//
//     final followerFollowingModel = followerFollowingModelFromJson(jsonString);

import 'dart:convert';

FollowerFollowingModel followerFollowingModelFromJson(String str) => FollowerFollowingModel.fromJson(json.decode(str));

String followerFollowingModelToJson(FollowerFollowingModel data) => json.encode(data.toJson());

class FollowerFollowingModel {
    FollowerFollowingModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory FollowerFollowingModel.fromJson(Map<String, dynamic> json) => FollowerFollowingModel(
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
        required this.id,
        required this.followedUserId,
        required this.followerUserId,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.fullName,
        required this.profilePic,
    });

    String id;
    String followedUserId;
    String followerUserId;
    DateTime createdAt;
    DateTime updatedAt;
    String userId;
    String fullName;
    String profilePic;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        followedUserId: json["followed_user_id"],
        followerUserId: json["follower_user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "followed_user_id": followedUserId,
        "follower_user_id": followerUserId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "full_name": fullName,
        "profile_pic": profilePic,
    };
}
