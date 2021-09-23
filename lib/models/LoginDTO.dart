import 'dart:convert';

LoginDto itemDetailsDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String itemDetailsDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
  LoginDto({
    this.status,
    this.msg,
    this.data,
  });

  String? status;
  String? msg;
  Data? data;

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
    status: json["status"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.accessToken,
  });

  User? user;
  String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "access_token": accessToken,
  };
}

class User {
  User({
    required this.id,
    this.photoProfile,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.birthday,
    this.phoneNum,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic photoProfile;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic gender;
  dynamic birthday;
  String? phoneNum;
  String? role;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    photoProfile: json["photo_profile"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    gender: json["gender"],
    birthday: json["birthday"],
    phoneNum: json["phone_num"],
    role: json["role"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo_profile": photoProfile,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "gender": gender,
    "birthday": birthday,
    "phone_num": phoneNum,
    "role": role,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
