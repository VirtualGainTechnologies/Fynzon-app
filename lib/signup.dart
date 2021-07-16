import 'package:fyn_zon/Node/createNode.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/otpregister.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
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
import './mainscreen.dart';
import './api/api.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  TextEditingController cpinController = new TextEditingController();
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  String phone_number = "";
  String fname = "";
  String lname = "";
  String email = "";
  String pin = "";
  String cpin = "";
  bool checkBoxValue = false;
  Future createAlbum() async {
    setState(() {_isLoading = true;});
    var data = {
      'phone': phone_number,
    };

    var apiData = {"url": AuthToken.api + "/" + "generateOTP", "data": data};

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
      setState(() {_isLoading = false;});
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpRegister(
                phoneController.text,
                pinController.text,
                fnameController.text,
                lnameController.text,
                emailController.text)),
      );
    }, (onError) {
      setState(() {_isLoading = false;});
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

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          color: Color(0xFF233446),
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "./assets/fynzon_logo.png",
                    height: 80,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text.isEmpty) return 'Please enter mobile number';
                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(patttern);
                          if (!regExp.hasMatch(text))
                            return 'Please enter valid mobile number'
                                .toLowerCase();
                          phone_number = phoneController.text;

                          return null;
                        },
                        onSaved: (text) => phone_number = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "Phone Number",
                          // fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        controller: fnameController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text.trim().length < 2)
                            return "name Should not be blank.";
                          fname = fnameController.text;
                          return null;
                        },
                        onSaved: (text) => fname = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "First Name",
                          // fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        controller: lnameController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text.trim().length < 2)
                            return "Last Name Should not be blank.";
                          lname = lnameController.text;
                          return null;
                        },
                        onSaved: (text) => lname = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "Last Name",
                          // fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        autovalidate: false,
                        validator: (text) {
                          if (text.isEmpty) return 'Enter Email Id';
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(text))
                            return 'Enter Valid Email'.toLowerCase();

                          email = emailController.text;
                          return null;
                        },
                        onSaved: (text) => email = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "Email Id",
                          //fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        controller: pinController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text.isEmpty) return "Enter Pin";
                          if (text.trim().length != 4) return "4 digit Pin";
                          pin = pinController.text;
                          return null;
                        },
                        onSaved: (text) => pin = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "4 Digit Pin",
                          //fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        controller: cpinController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text.isEmpty) return "Enter Pin";
                          if (text != pinController.text)
                            return "Pin did'n match";
                          cpin = cpinController.text;
                          return null;
                        },
                        onSaved: (text) => cpin = text,
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                          hintText: "Confirm PIN",
                          //fillColor: Colors.white70
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Referral Code",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: FormField<bool>(
                    builder: (state) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: checkBoxValue,
                                  onChanged: (value) {
                                    setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                                      checkBoxValue = value;
                                      state.didChange(value);
                                    });
                                  }),
                              RichText(
                                text: new TextSpan(
                                  children: <TextSpan>[
                                    new TextSpan(
                                      text: 'I agree to Fynzon`s',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 12),
                                    ),
                                    new TextSpan(
                                      text: ' Terms of Service',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
//display error in matching theme
                          Text(
                            state.errorText ?? '',
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                            ),
                          )
                        ],
                      );
                    },
//output from validation will be displayed in state.errorText (above)
                    validator: (value) {
                      if (!checkBoxValue) {
                        return 'You need to accept terms';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: () async {
                              // if(pin != cpin)

                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                createAlbum();
                              }
                            },
                            color: Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
