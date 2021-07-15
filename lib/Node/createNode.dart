import 'dart:async';
import 'dart:convert';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/signup.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUSDT {
  // ignore: missing_return
  static Future<SignupPage> balance(String phone, String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'phone': phone,
      'pin': pin,
    };
    var apiData = {
      "url":
          AuthToken.api+"/"+"clientBalance/" + prefs.getString('token'),
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("balance>>>>>>> " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }

  // ignore: missing_return
  static Future<SignupPage> usdt(String phone, String pin) async {
    var data = {'phone': phone, 'pin': pin};
    var apiData = {
      "url":
      AuthToken.api+"/"+"createUSDTNode",
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("usdthello>>>>>>>> " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }

  // ignore: missing_return
  static Future<SignupPage> eth(String phone, String pin) async {
    var data = {'phone': phone, 'pin': pin};
    var apiData = {
      "url":
      AuthToken.api+"/"+"createETHNode",
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("ETH>>>>>>>>>>: " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }

  // ignore: missing_return
  static Future<SignupPage> btc(String phone, String pin) async {
    var data = {'phone': phone, 'pin': pin};
    var apiData = {
      "url":
      AuthToken.api+"/"+"createBTCNode",
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("btc>>>>>>>>> " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }

  // ignore: missing_return
  static Future<SignupPage> crmt(String phone, String pin) async {
    var data = {'phone': phone, 'pin': pin};
    var apiData = {
      "url":
      AuthToken.api+"/"+"createCRMTNode",
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("CRMT>>>>>>> " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }

  // ignore: missing_return
  static Future<SignupPage> bch(String phone, String pin) async {
    var data = {
      'phone': phone,
      'pin': pin,
    };
    var apiData = {
      "url":
      AuthToken.api+"/"+"createBCHNode",
      "data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
      print("BCH>>>>>>> " + id);
    }, (onError) {
      print("Error working with the api");
    });
  }
}
