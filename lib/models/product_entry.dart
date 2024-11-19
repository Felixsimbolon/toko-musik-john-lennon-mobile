// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    String pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String item;
    String pictureLink;
    DateTime time;
    int price;
    String description;

    Fields({
        required this.user,
        required this.item,
        required this.pictureLink,
        required this.time,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        item: json["item"],
        pictureLink: json["picture_link"],
        time: DateTime.parse(json["time"]),
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "item": item,
        "picture_link": pictureLink,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "price": price,
        "description": description,
    };
}
