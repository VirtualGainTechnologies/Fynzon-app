import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/qrCode.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/tokenPass.dart';

import 'mainscreen.dart';

class QRPass {
  // ignore: missing_return
  static Future<QRCodeDigit> qrCode(String qr, BuildContext context) async {
    var data = {
      'authCode': qr,
    };
    var apiData = {
      "url": AuthToken.api + "/" + "tfa/verify/" + AuthToken.authtoken,
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("id");
      Fluttertoast.showToast(
          msg: "Successfully Verify Code",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("status: " + id);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreenPage()),
      );
    }, (onError) {
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // String token = AuthToken.authtoken;
      // final response = http.get(url, headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json',
      //   'Authorization': 'Bearer $token',
      // });
      // print('Token : ${token}');
      // print(response);
      print("Error working with the api");
      /*Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreenPage()),
      );*/
    });
  }
}
