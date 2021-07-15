import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';

Future postBuy(String base, String tread, String usdt,
    String btc, BuildContext context) async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
 /* var user = prefs.getString("userid");
  AuthToken.userid = user;
  var token = prefs.getString("token");
  AuthToken.authtoken = token;*/
  String url =AuthToken.api + "/" + "v2/buyPeer/" + prefs.getString('token');
  final response = await http.post(url,
      headers: {"Accept": "Application/json"},
      body: {

        'baseCurrency': base,
        'tradingCurrency': tread,
        'volume': usdt,
        'price': btc,
      }
  );

  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

