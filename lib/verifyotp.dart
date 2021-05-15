import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/otp.dart';
import 'package:http/http.dart' as http;
import 'package:fyn_zon/pin.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/tokenPass.dart';
  Future aAlbum(String otp,
      BuildContext context) async
  {
    String url = AuthToken.api + "/" + "verifyOTP";
    final response = await http.post(url,
        headers: {"Accept": "Application/json"},
        body: {

          "clientOTP": otp,
          "_id": AuthToken.veriotp,
        }
    );

    var convertedDatatoJson = jsonDecode(response.body);
    return convertedDatatoJson;
  }

