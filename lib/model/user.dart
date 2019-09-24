// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

class AuthResponse {
  String message;
  String token;
  User user;

  AuthResponse({
    this.message,
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        message: json["message"],
        token: json["token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
        "user": user.toMap(),
      };
}

class User {
  String gender;
  bool activated;
  String id;
  String email;
  String username;
  String password;
  String phone;
  String fullName;
  int v;

  User({
    this.gender,
    this.activated,
    this.id,
    this.email,
    this.username,
    this.password,
    this.phone,
    this.fullName,
    this.v,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        gender: json["gender"],
        activated: json["activated"],
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        fullName: json["fullName"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "activated": activated,
        "_id": id,
        "email": email,
        "username": username,
        "password": password,
        "phone": phone,
        "fullName": fullName,
        "__v": v,
      };
}
