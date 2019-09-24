// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

class CategoryList {
	int count;
	List<Category> categories;
	
	CategoryList({
		             this.count,
		             this.categories,
	             });
	
	factory CategoryList.fromJson(String str) => CategoryList.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
		count: json["count"] == null ? null : json["count"],
		categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
		);
	
	Map<String, dynamic> toMap() => {
		"count": count == null ? null : count,
		"categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toMap())),
	};
}

class Category {
	String name;
	String thumbnail;
	
	Category({
		         this.name,
		         this.thumbnail,
	         });
	
	factory Category.fromJson(String str) => Category.fromMap(json.decode(str));
	
	String toJson() => json.encode(toMap());
	
	factory Category.fromMap(Map<String, dynamic> json) => Category(
		name: json["name"] == null ? null : json["name"],
		thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
		);
	
	Map<String, dynamic> toMap() => {
		"name": name == null ? null : name,
		"thumbnail": thumbnail == null ? null : thumbnail,
	};
}
