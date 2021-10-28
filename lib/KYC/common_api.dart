
import '../tokenPass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future basicDetails(String dob, String address, String houseNo,String area, String societyName,
    String landmark, String country, String city, String state, String pinCode,
    ) async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"kyc/v2/general/"+prefs.getString('token');
  final response= await http.put(url,
      headers: {"Accept": "Application/json"},
      body: {
        "dob": dob,
        "address": address,
        "houseNo": houseNo,
        "area": area,
        "streetName": societyName,
        "landmark": landmark,
        "country": country,
        "city": city,
        "state":state,
        "pinCode": pinCode,
      }
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}


Future bank(String bankname, String acc, String ifsc, String type) async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"kyc/v2/bank/"+prefs.getString('token');
  final response= await http.put(url,
      headers: {"Accept": "Application/json"},
      body: {
        "bankName":bankname,
        "bankAccNo": acc,
        "ifscCode":ifsc,
        "accType": type
      }
  );
  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}


Future response() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"kyc/v2/status/"+prefs.getString('token');
  final response= await http.get(url,
      headers: {"Accept": "Application/json"},
      /*body: {
      }*/
  );
  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}



Future update(String address, String houseNo,String area, String streetName,
    String landmark, String country, String city, String state, String pinCode,
    ) async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"kyc/v2/userProfile/"+prefs.getString('token');
  final response= await http.put(url,
      headers: {"Accept": "Application/json"},
      body: {
        "address": address,
        "houseNo": houseNo,
        "area": area,
        "streetName": streetName,
        "landmark": landmark,
        "country": country,
        "city": city,
        "state":state,
        "pinCode": pinCode,
      }
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}

Future getUser() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"kyc/v2/userProfile/"+prefs.getString('token');
  final response= await http.get(url,
      headers: {"Accept": "Application/json"},
     /* body: {

      }*/
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}

Future getCRMT() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = AuthToken.api+"/"+"crmt/getCRMTSum/"+prefs.getString('token');
  final response= await http.get(url,
    headers: {"Accept": "Application/json"},
    /* body: {

      }*/
  );

  var convertedDatatoJson =jsonDecode(response.body);
  return convertedDatatoJson;

}