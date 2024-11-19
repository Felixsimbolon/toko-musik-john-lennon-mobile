import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  String item;
  String pictureLink;
  String description;
  int price;

  Fields({
    required this.item,
    required this.pictureLink,
    required this.description,
    required this.price,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        item: json["item"],
        pictureLink: json["picture_link"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "picture_link": pictureLink,
        "description": description,
        "price": price,
      };
}
