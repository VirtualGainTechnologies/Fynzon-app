import 'package:fyn_zon/Node/createNode.dart';
import 'package:flutter/material.dart';
import 'package:fyn_zon/signup.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/mainscreen.dart';
import 'package:fyn_zon/tokenPass.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

import 'custom_appbar.dart';

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
  bool _isLoadingresend = false;
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
    setState(() {
      _isLoadingresend = true;
    });
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
      setState(() {
        _isLoadingresend = false;
      });
      Fluttertoast.showToast(
          msg: "OTP Sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (onError) {
      setState(() {
        _isLoadingresend = false;
      });
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
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
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignupPage(),
          ),
        );
      },
      child: Scaffold(
        appBar: appBar('Phone Authentication'),
        key: globalKey,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
             /* mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 00),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("./assets/images/fynzon_logo.png",
                          height: 40,),
                        Image.asset("./assets/images/fynzon_text.png",width: 170,
                          height: 60,),

                      ])
                ),
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0),
                 ),
                 child: Column(
                   children: [
                     Padding(
                       padding: EdgeInsets.all(15),
                       child: Align(
                         alignment: Alignment.topLeft,
                         child: Text(
                           "Verify Mobile Number",
                           style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.w600,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Divider(
                         color: Colors.grey.shade200,
                         thickness: 1.5,
                       ),
                     ),
                     SizedBox(
                       height: 50,
                     ),
                     Image.asset("./assets/images/security.png",width: 170,
                       height: 60,),
                     SizedBox(
                       height: 30,
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "Please Enter the verification code sent to",
                         textAlign: TextAlign.center,
                         style: TextStyle( fontSize: 16,
                             fontFamily: 'berlinsans',
                             letterSpacing: 0.6,
                             color: Colors.black87),
                       ),
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Text(
                       "+91 $phone_number",
                       textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 20,
                         color: Colors.black,
                         fontFamily: 'berlinsans',
                         letterSpacing: 1,),
                     ),
                     SizedBox(
                       height: 30,
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
                             color: Colors.black
                         ),
                         decoration: new InputDecoration(
                           isDense: true,
                           contentPadding: new EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                           fillColor: Colors.white,
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(40),
                             borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(40),
                             borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                           ),
                           filled: true,
                           hintStyle:
                           new TextStyle(
                             color: Colors.grey,
                           ),
                           hintText: "Enter Verification Code",
                           // fillColor: Colors.white70
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Divider(
                         color: Colors.grey.shade200,
                         thickness: 1.5,
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         _isLoading
                             ?CircularProgressIndicator(
                             strokeWidth: 6.0,
                             backgroundColor: Colors.green,
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                         ):
                         MaterialButton(
                           minWidth: 110,
                           height: 30,
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
                                   msg: "verified Successfully",
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
                           color:Color(0xFF144A7D),
                           elevation: 0,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5)),
                           child: Text(
                             "Verify",
                             style: TextStyle(

                                 fontSize: 16,
                                 fontFamily: 'berlinsans',
                                 color: Colors.white),
                           ),
                         ),
                         Container(
                           child: _isLoadingresend
                               ?CircularProgressIndicator(
                               strokeWidth: 6.0,
                               backgroundColor: Colors.green,
                               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                           ):
                           MaterialButton(
                             height: 30,
                             minWidth: 110,
                             onPressed: () async {
                               createAlbum();
                             },
                             color:Color(0xFF144A7D),
                             //color: Colors.blue,
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(5)),
                             child: Text(
                               "Resend",
                               style: TextStyle(
                                   fontFamily: 'berlinsans',
                                   fontSize: 16,
                                   color: Colors.white),
                             ),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 20,
                     ),
                   ],
                 ),
               )
              ],
            ),
          ),
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
      Fluttertoast.showToast(
          msg: rsp['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var user_id = data['userid'];
      var token = data['token'];
      var fname = data['fname'];
      var lname = data['lanme'];
      var email = data['email'];
      var phone = data['phone'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userid', user_id);
      prefs.setString('token', token);
      prefs.setString('fname', fname);
      prefs.setString('lname', lname);
      prefs.setString('email', email);
      prefs.setString('phone', phone.toString());
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