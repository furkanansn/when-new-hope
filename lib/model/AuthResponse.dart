// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.success,
    this.data,
    this.errorMessage,
  });

  bool success;
  Data data;
  dynamic errorMessage;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : data.toJson(),
    "errorMessage": errorMessage,
  };
}

class Data {
  Data({
    this.id,
    this.accessToken,
  });

  int id;
  String accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "accessToken": accessToken == null ? null : accessToken,
  };
}
