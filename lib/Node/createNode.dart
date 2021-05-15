import 'dart:async';
import 'dart:convert';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/signup.dart';
import 'package:fyn_zon/tokenPass.dart';

class CreateUSDT {
  // ignore: missing_return
  static Future<SignupPage> balance(String phone, String pin) async {
    var data = {
      'phone': phone,
      'pin': pin,
    };
    var apiData = {
      "url":
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/clientBalance/" +
              AuthToken.authtoken,
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
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/createUSDTNode",
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
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/createETHNode",
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
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/createBTCNode",
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
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/createCRMTNode",
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
          "http://Fynzonbackend-env.eba-whd8wud9.ap-southeast-1.elasticbeanstalk.com/createBCHNode",
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
