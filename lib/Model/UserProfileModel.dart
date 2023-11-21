// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    Data data;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
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
        required this.followers,
        required this.followings,
        required this.isFollowed,
        required this.totalPosts,
        required this.posts,
        required this.chatId,
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
    String followers;
    String followings;
    bool isFollowed;
    int totalPosts;
    List<Post> posts;
    String chatId;

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
        followers: json["followers"],
        followings: json["followings"],
        isFollowed: json["is_followed"],
        totalPosts: json["total_posts"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        chatId: json["chat_id"].toString(),
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
        "followers": followers,
        "followings": followings,
        "is_followed": isFollowed,
        "total_posts": totalPosts,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "chat_id": chatId,
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
