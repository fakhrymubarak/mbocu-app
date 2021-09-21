import 'dart:convert';

ItemDetailsDto itemDetailsDtoFromJson(String str) => ItemDetailsDto.fromJson(json.decode(str));

String itemDetailsDtoToJson(ItemDetailsDto data) => json.encode(data.toJson());

class ItemDetailsDto {
  ItemDetailsDto({
    this.status,
    this.msg,
    this.data,
  });

  String? status;
  String? msg;
  List<ItemDetails>? data;

  factory ItemDetailsDto.fromJson(Map<String, dynamic> json) => ItemDetailsDto(
    status: json["status"],
    msg: json["msg"],
    data: List<ItemDetails>.from(json["data"].map((x) => ItemDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
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
    this.listItem,
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
  List<ItemDetails>? listItem;

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
    listItem: List<ItemDetails>.from(json["item"].map((x) => ItemDetails.fromJson(x))),
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
    "item": List<dynamic>.from(listItem!.map((x) => x.toJson())),
  };
}

class ItemDetails {
  ItemDetails({
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

  factory ItemDetails.fromJson(Map<String, dynamic> json) => ItemDetails(
    id: json["id"],
    icon: json["icon"],
    merchantId: json["merchant_id"],
    name: json["name"],
    desc: json["desc"],
    price: json["price"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    merchant: json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
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
    "merchant": merchant == null ? null : merchant!.toJson(),
  };
}
