// To parse this JSON data, do
//
//     final shops = shopsFromJson(jsonString);

import 'dart:convert';

class Shops {
	int count;
	List<Shop> shop;
	
	Shops({
		      this.count,
		      this.shop,
	      });
	
	factory Shops.fromJson(String str) => Shops.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory Shops.fromMap(Map<String, dynamic> json) => Shops(
		count: json["count"],
		shop: List<Shop>.from(json["shop"].map((x) => Shop.fromMap(x))),
		);
	
	Map<String, dynamic> toMap() => {
		"count": count,
		"shop": List<dynamic>.from(shop.map((x) => x.toMap())),
	};
}

class Shop {
	String paymentMethod;
	String id;
	String user;
	String businessName;
	String category;
	int v;
	
	Shop({
		     this.paymentMethod,
		     this.id,
		     this.user,
		     this.businessName,
		     this.category,
		     this.v,
	     });
	
	factory Shop.fromJson(String str) => Shop.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory Shop.fromMap(Map<String, dynamic> json) => Shop(
		paymentMethod: json["paymentMethod"],
		id: json["_id"],
		user: json["user"],
		businessName: json["businessName"],
		category: json["category"],
		v: json["__v"],
		);
	
	Map<String, dynamic> toMap() => {
		"paymentMethod": paymentMethod,
		"_id": id,
		"user": user,
		"businessName": businessName,
		"category": category,
		"__v": v,
	};
}
