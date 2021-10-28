import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiClass{

  static void getApiCall(data, onSuccess, onError){
    final Map<String, String> defaultgetHeader = {
      "Content-Type": "application/json",
    };
    print("url ${data["url"]}");
    var header = data.containsKey("header") ? data["header"] : defaultgetHeader;

    http
        .get(data["url"], headers: header)
        .timeout(
          Duration(seconds: 10),
        )
        .then((http.Response response) {
      print("errror ${response.statusCode}");
      if (response.statusCode < 200 ||
          response.statusCode >= 400) {
        onError({"status": 0, "message": response.body});
      }else {
        onSuccess({"status": 1, "response": response.body});
      }
    }).catchError((error) {
      print("errror $error");
      if (error is TimeoutException || error is SocketException) {
        onError({
          "status": -1,
          "message":
              "We're having problems. Please check your internet connection."
        });
        return;
      }
      onError({"status": 0, "message": error});
    });
  }

  static void getApiCallWithAuth(data, onSuccess, onError) {
    final Map<String, String> defaultgetHeader = {
      "Content-Type": "application/json",
      // "Authorization": 'Bearer ${AuthToken.authtoken}',
    };
    print("url ${data["url"]}");
    var header = data.containsKey("header") ? data["header"] : defaultgetHeader;

    http
        .get(data["url"], headers: header)
        .timeout(
          Duration(seconds: 20),
        )
        .then((http.Response response) {
      print("errror ${response.statusCode}");
      if (response.statusCode < 200 ||
          response.statusCode >= 400 ||
          response == null) {
        onError({"status": 0, "message": response.body});
      } else {
        onSuccess({"status": 1, "response": response.body});
      }
    }).catchError((error) {
      print("errror $error");
      if (error is TimeoutException || error is SocketException) {
        onError({
          "status": -1,
          "message":
              "Something went wrong, please check your internet connection."
        });
        return;
      }
      onError({"status": 0, "message": error});
    });
  }

  static void getApiCallPlain(data, onSuccess, onError) {
    final Map<String, String> defaultgetHeader = {
//      "Content-Type": "application/json",
    };
    print("url ${data["url"]}");
    var header = data.containsKey("header") ? data["header"] : defaultgetHeader;

    http
        .get(data["url"], headers: header)
        .timeout(
          Duration(seconds: 10),
        )
        .then((http.Response response) {
      print("errror ${response.statusCode}");
      print("response -> ${response.toString()}");
      if (response.statusCode < 200 ||
          response.statusCode >= 400 ||
          response == null) {
        onError({"status": 0, "message": response.body});
      } else {
        onSuccess({"status": 1, "response": response.body});
      }
    }).catchError((error) {
      print("errror $error");
      if (error is TimeoutException || error is SocketException) {
        onError({
          "status": -1,
          "message":
              "We're having problems. Please check your internet connection."
        });
        return;
      }
      onError({"status": 0, "message": error});
    });
  }

  static getAsyncApiCall(data) async {
    final Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
    };
    var header = data.containsKey("header") ? data["header"] : defaultHeader;
//print('djshgv $data["url"]');
    final response = await http.get(data["url"], headers: header);
    return response == null ||
            response.statusCode < 200 ||
            response.statusCode >= 400
        ? {"status": 0, "message": response.body}
        : {"status": 1, "response": json.decode(response.body)};
  }

  static void postApiCall(apiData, onSuccess, onError) {
    final Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };
    var header =
        apiData.containsKey("header") ? apiData["header"] : defaultHeader;
    print("post data ${apiData["data"]}");

    http
        .post(apiData["url"],
            headers: header, body: json.encode(apiData["data"] ?? {}))
        .timeout(const Duration(seconds: 20))
        .then((http.Response response) {
      print("response ${response.body}");

      response.statusCode < 200 ||
              response.statusCode >= 400 ||
              response == null
          ? onError({
              "status": 0,
              "message": response.statusCode == 404
                  ? json.encode({"message": "url not found."})
                  : response.body
            })
          : onSuccess({"status": 1, "response": response.body});
    })
          ..catchError((error) {
            print("errror $error");
            if (error is TimeoutException || error is SocketException) {
              onError({
                "status": -1,
                "message":
                    "We're having problems. Please check your internet connection."
              });
              return;
            }

            onError({"status": 0, "message": error});
          });
  }

  //for token
  static void postApiCalltoken(apiData, onSuccess, onError) {
    //  String token = AuthToken.authtoken;
    final Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    var header =
        apiData.containsKey("header") ? apiData["header"] : defaultHeader;
    print("post data ${apiData["data"]}");

    http
        .post(apiData["url"],
            headers: header, body: json.encode(apiData["data"] ?? {}))
        .timeout(Duration(seconds: 20))
        .then((http.Response response) {
      print("response ${response.statusCode}");

      response.statusCode < 200 ||
              response.statusCode >= 400 ||
              response == null
          ? onError({
              "status": 0,
              "message": response.statusCode == 404
                  ? json.encode({"message": "url not found."})
                  : response.body
            })
          : onSuccess({"status": 1, "response": response.body});
    })
          ..catchError((error) {
            print("errror $error");
            if (error is TimeoutException || error is SocketException) {
              onError({
                "status": -1,
                "message":
                    "We're having problems. Please check your internet connection."
              });
              return;
            }

            onError({"status": 0, "message": error});
          });
  }

// static void postUpdateApiCall(data,onSuccess,onError)
// {
//
//   final Map<String, String> defaultHeader = {
//              "Content-Type": "application/json",
//       };
//   var header=data.containsKey("header")?data["header"]:defaultHeader;
//
//    http.post(data["url"],headers: header,
//   body: json.encode( data)).then((http.Response response){
//
//     response.statusCode < 200 || response.statusCode > 400 || response == null?onError(
//       {"status":0,"message": response.body}):
//       onSuccess({"status":1,"response":response.body});
//
//    }).catchError((error)=>{
//      onError({"status":0,"message": error})
//    });
// }
  static void postApiCallWithAuthHeader(apiData, onSuccess, onError) {
    final Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      // "Authorization": 'Bearer ${AuthToken.authtoken}',
    };
    var header =
        apiData.containsKey("header") ? apiData["header"] : defaultHeader;
    print("post data ${apiData["data"]}");

    http
        .post(apiData["url"],
            headers: header, body: json.encode(apiData["data"] ?? {}))
        .timeout(Duration(seconds: 20))
        .then((http.Response response) {
      print("response ${response.statusCode}");
      response.statusCode < 200 ||
              response.statusCode >= 400 ||
              response == null
          ? onError({
              "status": 0,
              "message": response.statusCode == 404
                  ? json.encode({"message": "Not Found"})
                  : response.body
            })
          : onSuccess({"status": 1, "response": response.body});
    })
          ..catchError((error) {
            print("errror $error");
            if (error is TimeoutException || error is SocketException) {
              onError({
                "status": -1,
                "message":
                    "Something went wrong, please check your internet connection."
              });
              return;
            }

            onError({"status": 0, "message": error});
          });
  }
}
