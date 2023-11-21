// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    NotificationModel({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
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
        required this.senderUserId,
        required this.receiverUserId,
        required this.postId,
        required this.notificationType,
        required this.notification,
        required this.isRead,
        required this.createdAt,
        required this.updatedAt,
        required this.senderUserName,
        required this.senderUserImage,
    });

    String id;
    String senderUserId;
    String receiverUserId;
    String postId;
    String notificationType;
    String notification;
    String isRead;
    DateTime createdAt;
    DateTime updatedAt;
    String senderUserName;
    String senderUserImage;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        senderUserId: json["sender_user_id"],
        receiverUserId: json["receiver_user_id"],
        postId: json["post_id"],
        notificationType: json["notification_type"],
        notification: json["notification"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        senderUserName: json["sender_user_name"],
        senderUserImage: json["sender_user_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender_user_id": senderUserId,
        "receiver_user_id": receiverUserId,
        "post_id": postId,
        "notification_type": notificationType,
        "notification": notification,
        "is_read": isRead,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sender_user_name": senderUserName,
        "sender_user_image": senderUserImage,
    };
}
