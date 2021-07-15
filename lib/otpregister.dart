import 'package:fyn_zon/Node/createNode.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/mainscreen.dart';
import 'package:fyn_zon/tokenPass.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

// ignore: must_be_immutable
class OtpRegister extends StatefulWidget {
  @override
  String phone_number;
  String pin;
  String fname;
  String lname;
  String email;
  OtpRegister(this.phone_number,this.pin,this.fname,this.lname,this.email);
  State<StatefulWidget> createState() {
    return OtpRegisterState(this.phone_number, this.pin,this.fname,this.lname,this.email);
  }
}

class OtpRegisterState extends State<OtpRegister> {
  String phone_number;
  String pin;
  String fname;
  String lname;
  String email;
  OtpRegisterState(this.phone_number,this.pin,this.fname,this.lname,this.email);
  TextEditingController otpController = new TextEditingController();
  bool _isLoading = false;
  final globalKey = GlobalKey<ScaffoldState>();

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

  Future createAlbum() async {
    var data = {
      'phone': widget.phone_number,
    };

    var apiData = {
      "url": AuthToken.api + "/" +"generateOTP",
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var getOtp = jsonDecode(onSuccess["response"]);
      var res = getOtp['data'];
      var veriid = res['_id'];
      print(veriid);
      AuthToken.veriotp = veriid;

      Fluttertoast.showToast(
          msg: "OTP send successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        color: Color(0xFF233446),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignupPage()),
                );*/
              },
              child: Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 22),
                child: Icon(Icons.close,color: Colors.white,),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.message,color: Colors.white,),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: Text(
                        "Enter the OTP sent to your mobile",
                        style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 45,right: 45),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        autocorrect: true,
                        autofocus: false,
                        controller: otpController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle:
                          new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "OTP",
                          // fillColor: Colors.white70
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.only(top: 3, left: 45,right: 45,),

                      child: _isLoading
                          ?CircularProgressIndicator():
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 45,
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(()=> _isLoading = true);
                          var otp = otpController.text;
                          var rsp = await aAlbum(otp, context);
                          var data = rsp['data'];
                          var error = rsp['error'];
                          if (error == "true"){
                            Fluttertoast.showToast(
                                msg: "Mobile verification failed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(()=> _isLoading = false);
                          }else{
                            Fluttertoast.showToast(
                                msg: "verified number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            register();
                            setState(()=> _isLoading = false);


                          }

                        },
                        color: Colors.blueGrey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "AUTHENTICATE",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap:()async{
                        createAlbum();
                      },
                      child: Container(
                        child: RichText(
                          text: new TextSpan(
                            text: 'Did not receive OTP? ',
                            style: TextStyle(
                                color: Colors.blueGrey
                            ),
                            children: <TextSpan>[

                              new TextSpan(
                                text: 'RESEND in',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              new TextSpan(text: ' 60s', style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
  Future register()async{
    var rsp = await registerUser(
        phone_number, fname, lname, email, pin);
    var data = rsp['data'];
    var error = rsp['error'];
    if (error == "true") {
      globalKey.currentState
          .showSnackBar(new SnackBar(
        content: new Text(rsp['message']),
      ));
    } else {
      var user_id = data['userid'];
      var token = data['token'];
      /*print('auth token>>>>>>>>' + token);
      AuthToken.authtoken = token;
      print('auth>>>>>>>>' + AuthToken.authtoken);*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userid', user_id);
      prefs.setString('token', token);
      setState(() {
        prefs.setString('userid', user_id);
        prefs.setString('token', token);
        CreateUSDT.balance(phone_number, pin);
        CreateUSDT.usdt(phone_number, pin);
        CreateUSDT.eth(phone_number, pin);
        CreateUSDT.btc(phone_number, pin);
        CreateUSDT.crmt(phone_number, pin);
        CreateUSDT.bch(phone_number, pin);
        //  Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainScreenPage()),
        );
      });
    }
  }
}




/*var otp = otpController.text;
                          /*  VerifyOtp.createAlbum(
                             otp, phone_number, context);*/
                          var rsp = await aAlbum(otp, context);
                          var data = rsp['data'];
                          var error = rsp['error'];
                          if (error == "true"){
                            Fluttertoast.showToast(
                                msg: "Mobile verification failed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Successfully verified mobile number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              CreateUSDT.balance(phone_number, pin);
                              CreateUSDT.usdt(phone_number, pin);
                              CreateUSDT.eth(phone_number, pin);
                              CreateUSDT.btc(phone_number, pin);
                              CreateUSDT.crmt(phone_number, pin);
                              CreateUSDT.bch(phone_number, pin);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainScreenPage()),
                              );
                            });
                          }

                        },*/

/*
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF18222C),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "./assets/fynzon_logo.png",
              height: 80,
              width: 200,
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OTP",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your Otp",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: PinInputTextField(
                      pinLength: 6,
                      keyboardType: TextInputType.text,
                      controller: otpController,


                      // end onSubmit
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          var otp = otpController.text;
                          *//*  VerifyOtp.createAlbum(
                             otp, phone_number, context);*//*
                          var rsp = await aAlbum(otp, context);
                          var data = rsp['data'];
                          var error = rsp['error'];
                          if (error == "true"){
                            Fluttertoast.showToast(
                                msg: "Mobile verification failed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Successfully verified mobile number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              CreateUSDT.balance(phone_number, pin);
                              CreateUSDT.usdt(phone_number, pin);
                              CreateUSDT.eth(phone_number, pin);
                              CreateUSDT.btc(phone_number, pin);
                              CreateUSDT.crmt(phone_number, pin);
                              CreateUSDT.bch(phone_number, pin);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainScreenPage()),
                              );
                            });
                          }

                        },
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/*/