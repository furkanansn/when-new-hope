// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    this.success,
    this.data,
    this.errorMessage,
  });

  bool success;
  List<Datum> data;
  dynamic errorMessage;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.eventImagePath,
    this.city,
    this.date,
    this.users,
    this.userVips,
  });

  int id;
  String title;
  String eventImagePath;
  String city;
  DateTime date;
  List<dynamic> users;
  UserVips userVips;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    eventImagePath: json["eventImagePath"] == null ? null : json["eventImagePath"],
    city: json["city"] == null ? null : json["city"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    users: json["users"] == null ? null : List<dynamic>.from(json["users"].map((x) => x)),
    userVips: json["userVips"] == null ? null : UserVips.fromJson(json["userVips"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "eventImagePath": eventImagePath == null ? null : eventImagePath,
    "city": city == null ? null : city,
    "date": date == null ? null : date.toIso8601String(),
    "users": users == null ? null : List<dynamic>.from(users.map((x) => x)),
    "userVips": userVips == null ? null : userVips.toJson(),
  };
}

class UserVips {
  UserVips({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.username,
    this.email,
    this.phone,
    this.photo,
    this.bio,
    this.password,
    this.latitude,
    this.longitude,
    this.role,
    this.confirmedAccount,
  });

  dynamic createdAt;
  dynamic updatedAt;
  int id;
  String username;
  String email;
  String phone;
  String photo;
  String bio;
  String password;
  double latitude;
  double longitude;
  String role;
  String confirmedAccount;

  factory UserVips.fromJson(Map<String, dynamic> json) => UserVips(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    photo: json["photo"] == null ? null : json["photo"],
    bio: json["bio"] == null ? null : json["bio"],
    password: json["password"] == null ? null : json["password"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    role: json["role"] == null ? null : json["role"],
    confirmedAccount: json["confirmedAccount"] == null ? null : json["confirmedAccount"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "photo": photo == null ? null : photo,
    "bio": bio == null ? null : bio,
    "password": password == null ? null : password,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "role": role == null ? null : role,
    "confirmedAccount": confirmedAccount == null ? null : confirmedAccount,
  };
}
