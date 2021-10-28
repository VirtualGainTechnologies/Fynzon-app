import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyn_zon/capta.dart';
import 'package:fyn_zon/mainscreen.dart';
import './signup.dart';
import './otp.dart';
import 'dart:convert';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/Forgot_PIN/forgotScreen.dart';
import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

import 'custom_appbar.dart';
class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  String phone = "";
  bool _isLoading = false;
  bool isValid = false;

  bool verify =false;

  Future createAlbum(String phone) async {
    setState(()=> _isLoading= true);
    var data = {
      'phone': phone,
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
          msg: "OTP Sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(()=> _isLoading= false);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OtpPage(phoneController.text)),
      );

    }, (onError) {
      setState(()=> _isLoading= false);
      Fluttertoast.showToast(
          msg: "Verification Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Error working with the api");
    });
  }


  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => MainScreenPage(),
        ),
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar('Login'),
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
          ),
          padding: EdgeInsets.all(10.0),

          child: Form(
            key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 00),
                      child: Row(
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('Login to Fynzon',style: TextStyle(
                                fontSize: 17,
                                //fontFamily: 'berlinsans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Fynzon will send One time Password to verify your phone number',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    //fontFamily: 'berlinsans',
                                    color: Colors.black
                                ),),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              autocorrect: true,
                              autofocus: false,
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.white,
                              onChanged: (text){
                                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = new RegExp(patttern);
                                if (regExp.hasMatch(text)){
                                  setState(() {
                                    verify = true;
                                  });
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Capta()),
                                  );*/
                                }else{
                                  setState(() {
                                    verify = false;
                                  });
                                }
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 2
                              ),
                              validator: (text) {
                                if (text.isEmpty) return 'Please enter mobile number';
                                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = new RegExp(patttern);
                                if (!regExp.hasMatch(text))
                                  return 'Enter valid mobile number'
                                      .toLowerCase();
                                phone = phoneController.text;
                                return null;
                              },
                              onSaved: (text) => phone = text,
                              decoration: new InputDecoration(
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 2.0),
                                ),
                                filled: true,
                                hintStyle:
                                new TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500),
                                hintText: "Mobile Number",

                                // fillColor: Colors.white70
                              ),
                            ),
                          ),
                           verify == true ?
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 20, bottom: 20),
                            child: _isLoading
                                ?Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 6.0,
                                  backgroundColor: Colors.green,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                                //valueColor: new AlwaysStoppedAnimation<Color>(ColorTween(begin: Colors.lightBlue, end: Colors.redAccent)),
                              ),
                            )
                                : MaterialButton(
                              minWidth: double.infinity,
                              height: 45,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                      createAlbum(phoneController.text);
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Capta()),
                                  );*/
                                }
                              },
                              color:Color(0xFF144A7D),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontFamily: 'berlinsans',
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ):
                               Container(
                                 margin: EdgeInsets.only(top: 20),
                                 padding: EdgeInsets.only(
                                     left: 30, right: 30, top: 20, bottom: 20),
                                 child: MaterialButton(
                                   minWidth: double.infinity,
                                   height: 45,
                                   onPressed: (){

                                   },
                                   color:Color(0xFFE3F3FD),
                                   elevation: 0,
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(30)),
                                   child: Text(
                                     "Continue",
                                     style: TextStyle(
                                         fontFamily: 'berlinsans',
                                         letterSpacing: 1,
                                         fontSize: 16,
                                         color: Colors.white),
                                   ),
                                 ),
                               ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignupPage()),
                                  );
                                },
                                child: Text('Create an Account',style: TextStyle(
                                    fontSize: 16,
                                    //fontFamily: 'berlinsans',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),),
                              ),
                              Text('Support',style: TextStyle(
                                  fontSize: 16,
                                  //fontFamily: 'berlinsans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              ),)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
      ),
    ],
  );
}
