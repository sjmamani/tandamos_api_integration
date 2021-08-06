// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.user,
    required this.accessToken,
    required this.expiresIn,
  });

  User user;
  String accessToken;
  String expiresIn;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
        "expires_in": expiresIn,
      };
}

class User {
  User({
    required this.idUser,
    required this.userName,
  });

  int idUser;
  String userName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "user_name": userName,
      };
}
