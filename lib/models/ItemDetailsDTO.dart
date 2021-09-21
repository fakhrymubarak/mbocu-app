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
  List<Datum>? data;

  factory ItemDetailsDto.fromJson(Map<String, dynamic> json) => ItemDetailsDto(
    status: json["status"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    this.item,
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
  List<Datum>? item;

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
    item: List<Datum>.from(json["item"].map((x) => Datum.fromJson(x))),
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
    "item": List<dynamic>.from(item!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
