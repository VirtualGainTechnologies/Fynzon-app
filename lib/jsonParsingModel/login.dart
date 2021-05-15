// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.message,
    this.error,
    this.data,
  });

  String message;
  String error;
  Data data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    message: json["message"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.userid,
    this.phone,
    this.token,
  });

  String userid;
  int phone;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userid: json["userid"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "phone": phone,
    "token": token,
  };
}
