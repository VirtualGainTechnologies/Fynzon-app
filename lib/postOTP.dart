import 'otp.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

class PostOTPInfo {
  // ignore: missing_return
  static Future<OtpPage> createAlbum(String fname, BuildContext context) async {
    var data = {
      'fname': fname,
    };

    var apiData = {
      "url": "http://www.smsgateway.center/SMSApi/rest/send?",
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("id");
      print("status: " + id);
      Navigator.pop(context);
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PinPage(phoneNumber),
        ),
      );*/
    }, (onError) {
      print("Error working with the api");
    });
  }

}
