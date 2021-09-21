// To parse this JSON data, do
//
//     final itemsByLocationDto = itemsByLocationDtoFromJson(jsonString);

import 'dart:convert';

ItemsByLocationDto itemsByLocationDtoFromJson(String str) =>
    ItemsByLocationDto.fromJson(json.decode(str));

String itemsByLocationDtoToJson(ItemsByLocationDto data) =>
    json.encode(data.toJson());

class ItemsByLocationDto {
  ItemsByLocationDto({
    this.status,
    this.msg,
    this.data,
  });

  String? status;
  String? msg;
  List<FoodItem>? data;

  factory ItemsByLocationDto.fromJson(Map<String, dynamic> json) =>
      ItemsByLocationDto(
        status: json["status"],
        msg: json["msg"],
        data:
            List<FoodItem>.from(json["data"].map((x) => FoodItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FoodItem {
  FoodItem({
    this.id,
    this.icon,
    this.merchantId,
    this.name,
    this.desc,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.merchant,
  });

  int? id;
  String? icon;
  int? merchantId;
  String? name;
  String? desc;
  String? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Merchant? merchant;

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        id: json["id"],
        icon: json["icon"],
        merchantId: json["merchant_id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        merchant: Merchant.fromJson(json["merchant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "merchant_id": merchantId,
        "name": name,
        "desc": desc,
        "price": price,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "merchant": merchant!.toJson(),
      };
}

class Merchant {
  Merchant({
    this.id,
    this.userId,
    this.icon,
    this.name,
    this.desc,
    this.long,
    this.lat,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? icon;
  String? name;
  String? desc;
  String? long;
  String? lat;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        userId: json["user_id"],
        icon: json["icon"],
        name: json["name"],
        desc: json["desc"],
        long: json["long"],
        lat: json["lat"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "icon": icon,
        "name": name,
        "desc": desc,
        "long": long,
        "lat": lat,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
