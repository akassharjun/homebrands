// To parse this JSON data, do
//
//     final shopList = shopListFromJson(jsonString);

import 'dart:convert';

class ShopList {
  int count;
  List<Shop> shopList;

  ShopList({
    this.count,
    this.shopList,
  });

  factory ShopList.fromJson(String str) => ShopList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShopList.fromMap(Map<String, dynamic> json) => ShopList(
        count: json["count"] == null ? null : json["count"],
        shopList: json["items"] == null
            ? null
            : List<Shop>.from(json["items"].map((x) => Shop.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count == null ? null : count,
        "items": shopList == null
            ? null
            : List<dynamic>.from(shopList.map((x) => x.toMap())),
      };
}

class Shop {
  String paymentMethod;
  String id;
  String user;
  String category;
  String businessName;
  String image;
  int v;
  bool isFeatured;

  Shop({
    this.paymentMethod,
    this.id,
    this.user,
    this.category,
    this.businessName,
    this.image,
    this.v,
    this.isFeatured,
  });

  factory Shop.fromJson(String str) => Shop.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shop.fromMap(Map<String, dynamic> json) => Shop(
        paymentMethod:
            json["paymentMethod"] == null ? null : json["paymentMethod"],
        id: json["_id"] == null ? null : json["_id"],
        user: json["user"] == null ? null : json["user"],
        category: json["category"] == null ? null : json["category"],
        businessName:
            json["businessName"] == null ? null : json["businessName"],
        image: json["image"] == null ? null : json["image"],
        v: json["__v"] == null ? null : json["__v"],
        isFeatured: json["isFeatured"] == null ? null : json["isFeatured"],
      );

  Map<String, dynamic> toMap() => {
        "paymentMethod": paymentMethod == null ? null : paymentMethod,
        "_id": id == null ? null : id,
        "user": user == null ? null : user,
        "category": category == null ? null : category,
        "businessName": businessName == null ? null : businessName,
        "image": image == null ? null : image,
        "__v": v == null ? null : v,
        "isFeatured": isFeatured == null ? null : isFeatured,
      };
}
