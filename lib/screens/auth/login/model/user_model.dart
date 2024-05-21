// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Data data;
  Detail detail;

  UserModel({
    required this.data,
    required this.detail,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "detail": detail.toJson(),
      };
}

class Data {
  String token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Detail {
  int id;
  String name;
  String email;
  String country;
  String phone;
  String avatar;
  DateTime createdAt;

  Detail({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.phone,
    required this.avatar,
    required this.createdAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        name: json["name"].toString(),
        email: json["email"].toString(),
        country: json["country"].toString(),
        phone: json["phone"].toString(),
        avatar: json["avatar"].toString(),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "country": country,
        "phone": phone,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
      };
}
