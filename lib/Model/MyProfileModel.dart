// To parse this JSON data, do
//
//     final myProfileModel = myProfileModelFromJson(jsonString);

import 'dart:convert';

MyProfileModel myProfileModelFromJson(String str) => MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
    MyProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    Data data;

    factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.fullName,
        required this.email,
        required this.loginType,
        required this.profilePic,
        this.aboutMe,
        required this.isActive,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
        required this.totalPosts,
        required this.followers,
        required this.followings,
        required this.posts,
    });

    String id;
    String fullName;
    String email;
    String loginType;
    String profilePic;
    dynamic aboutMe;
    String isActive;
    String isDeleted;
    DateTime createdAt;
    DateTime updatedAt;
    int totalPosts;
    String followers;
    String followings;
    List<Post> posts;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        loginType: json["login_type"],
        profilePic: json["profile_pic"],
        aboutMe: json["about_me"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        totalPosts: json["total_posts"],
        followers: json["followers"],
        followings: json["followings"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "login_type": loginType,
        "profile_pic": profilePic,
        "about_me": aboutMe,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "total_posts": totalPosts,
        "followers": followers,
        "followings": followings,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    Post({
        required this.id,
        required this.userId,
        required this.title,
        required this.image,
        required this.isActive,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
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
    String isActive;
    String isDeleted;
    DateTime createdAt;
    DateTime updatedAt;
    String fullName;
    String profilePic;
    String userRating;
    String totalRating;
    String averageRating;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        image: json["image"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "full_name": fullName,
        "profile_pic": profilePic,
        "user_rating": userRating,
        "total_rating": totalRating,
        "average_rating": averageRating,
    };
}
