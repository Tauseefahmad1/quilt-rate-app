// To parse this JSON data, do
//
//     final userChatsModel = userChatsModelFromJson(jsonString);

import 'dart:convert';

UserChatsModel userChatsModelFromJson(String str) => UserChatsModel.fromJson(json.decode(str));

String userChatsModelToJson(UserChatsModel data) => json.encode(data.toJson());

class UserChatsModel {
    UserChatsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory UserChatsModel.fromJson(Map<String, dynamic> json) => UserChatsModel(
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
        required this.isSeen,
        required this.fullName,
        required this.profilePic,
        required this.lastMessage,
    });

    String id;
    String isSeen;
    String fullName;
    String profilePic;
    String lastMessage;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isSeen: json["is_seen"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
        lastMessage: json["last_message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_seen": isSeen,
        "full_name": fullName,
        "profile_pic": profilePic,
        "last_message": lastMessage,
    };
}
