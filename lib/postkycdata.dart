import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';

import 'kyc.dart';

class PostKYCInfo {
  // ignore: missing_return
  static Future<KYC> createAlbum(
      String selectedSalutation,
      String fname,
      String lname,
      String dob,
      String address,
      String state,
      String city,
      String pin,
      String pan,
      String adhaar,
      BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    AuthToken.authtoken = token;
    var data = {
      "fname": fname,
      "lname": lname,
      "city": city,
      "state": state,
      "pinCode": pin,
      "country": selectedSalutation,
      "dob": dob,
      "address": address,
      "panNumber": pan,
      "adhaarNumber": adhaar
    };

    var apiData = {
      "url":
          AuthToken.api + "/" + "client/updateProfile/" + AuthToken.authtoken,
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("id");
      Fluttertoast.showToast(
          msg: "Successfully Updated Profile",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("status: " + id);
      Navigator.pop(context);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => UserProfile(),
      //   ),
      // );
    }, (onError) {
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Error working with the api");
    });
  }
}
