// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    Data data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
        required this.profilePic,
        required this.token,
    });

    String id;
    String fullName;
    String email;
    String profilePic;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "profile_pic": profilePic,
        "token": token,
    };
}
