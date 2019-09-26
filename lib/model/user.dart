// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

class NewUser {
  String message;
  User user;

  NewUser({
    this.message,
    this.user,
  });

  factory NewUser.fromJson(String str) => NewUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewUser.fromMap(Map<String, dynamic> json) => NewUser(
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "user": user == null ? null : user.toMap(),
      };
}

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
  DateTime birthDay;
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
    this.birthDay,
    this.v,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        gender: json["gender"] == null ? null : json["gender"],
        activated: json["activated"] == null ? null : json["activated"],
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        birthDay:
            json["birthDay"] == null ? null : DateTime.parse(json["birthDay"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender == null ? null : gender,
        "activated": activated == null ? null : activated,
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "fullName": fullName == null ? null : fullName,
        "birthDay": birthDay == null ? null : birthDay.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
