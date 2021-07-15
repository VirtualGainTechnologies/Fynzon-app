import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../tokenPass.dart';

Future loginUser(String phone, String password) async
{
  String url = AuthToken.api+"/"+"login";
  final response= await http.post(url,
  headers: {"Accept": "Application/json"},
    body: {
        "phone": phone,
        "pin": password

    }
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}

Future registerUser(String phone_number, String fname, String lname, String email, String password) async
{
  String url = AuthToken.api+"/"+"register";
  final response= await http.post(url,
      headers: {"Accept": "Application/json"},
      body: {

          "phone": phone_number,
          "fname":fname,
          "lname":lname,
          "email":email,
          "pin": password

      }
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}

Future mainScreen() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api + "/" + "client/userDetails/"+ prefs.getString('token');
  final response= await http.post(url,
      headers: {"Accept": "Application/json"},
      body: {

      }
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}