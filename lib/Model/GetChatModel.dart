// To parse this JSON data, do
//
//     final getChatModel = getChatModelFromJson(jsonString);

import 'dart:convert';

GetChatModel getChatModelFromJson(String str) => GetChatModel.fromJson(json.decode(str));

String getChatModelToJson(GetChatModel data) => json.encode(data.toJson());

class GetChatModel {
    GetChatModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory GetChatModel.fromJson(Map<String, dynamic> json) => GetChatModel(
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
        required this.chatId,
        required this.senderUserId,
        required this.receiverUserId,
        required this.message,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    String chatId;
    String senderUserId;
    String receiverUserId;
    String message;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        chatId: json["chat_id"],
        senderUserId: json["sender_user_id"],
        receiverUserId: json["receiver_user_id"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "sender_user_id": senderUserId,
        "receiver_user_id": receiverUserId,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
