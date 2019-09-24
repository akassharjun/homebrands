// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

class Product {
	Price price;
	String id;
	String name;
	String business;
	String thumbnail;
	int v;
	
	Product({
		        this.price,
		        this.id,
		        this.name,
		        this.business,
		        this.thumbnail,
		        this.v,
	        });
	
	factory Product.fromJson(String str) => Product.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory Product.fromMap(Map<String, dynamic> json) => Product(
		price: Price.fromMap(json["price"]),
		id: json["_id"],
		name: json["name"],
		business: json["business"],
		thumbnail: json["thumbnail"],
		v: json["__v"],
		);
	
	Map<String, dynamic> toMap() => {
		"price": price.toMap(),
		"_id": id,
		"name": name,
		"business": business,
		"thumbnail": thumbnail,
		"__v": v,
	};
}

class Price {
	int amount;
	String currency;
	
	Price({
		      this.amount,
		      this.currency,
	      });
	
	factory Price.fromJson(String str) => Price.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory Price.fromMap(Map<String, dynamic> json) => Price(
		amount: json["amount"],
		currency: json["currency"],
		);
	
	Map<String, dynamic> toMap() => {
		"amount": amount,
		"currency": currency,
	};
}
