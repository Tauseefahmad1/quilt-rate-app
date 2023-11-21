// To parse this JSON data, do
//
//     final getPostsModel = getPostsModelFromJson(jsonString);

import 'dart:convert';

GetPostsModel getPostsModelFromJson(String str) => GetPostsModel.fromJson(json.decode(str));

String getPostsModelToJson(GetPostsModel data) => json.encode(data.toJson());

class GetPostsModel {
    GetPostsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory GetPostsModel.fromJson(Map<String, dynamic> json) => GetPostsModel(
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
        required this.userId,
        required this.title,
        required this.image,
        this.createdAt,
        this.updatedAt,
        required this.fullName,
        required this.profilePic,
        required this.userRating,
        required this.totalRating,
        required this.averageRating,
    });

    String id;
    String userId;
    String title;
    String image;
    dynamic createdAt;
    dynamic updatedAt;
    String fullName;
    String profilePic;
    String userRating;
    String totalRating;
    String averageRating;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
        userRating: json["user_rating"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "full_name": fullName,
        "profile_pic": profilePic,
        "user_rating": userRating,
        "total_rating": totalRating,
        "average_rating": averageRating,
    };
}
