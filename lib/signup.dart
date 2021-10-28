import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/otpregister.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

import 'custom_appbar.dart';
import 'login.dart';

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
          msg: "OTP Sent successfully",
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
            builder: (context) => LoginScreen(),
        ),
        );
      },
      child: Scaffold(
        appBar: appBar('SignUp'),
        resizeToAvoidBottomInset: false,
        key: globalKey,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
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
                  color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Register',style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.5,
                            //fontFamily: 'berlinsans',
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),
                        ),

                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: <Widget>[

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    autofocus: false,
                                    controller: fnameController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.trim().length < 2)
                                        return "name Should not be blank.";
                                      fname = fnameController.text;
                                      return null;
                                    },
                                    onSaved: (text) => fname = text,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12),
                                      hintText: "First Name",
                                      // fillColor: Colors.white70
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    autofocus: false,
                                    controller: lnameController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.trim().length < 2)
                                        return "Last Name Should not be blank.";
                                      lname = lnameController.text;
                                      return null;
                                    },
                                    onSaved: (text) => lname = text,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12),
                                      hintText: "Last Name",
                                      // fillColor: Colors.white70
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.black
                              ),
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
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12),
                                hintText: "Mobile Number",
                                // fillColor: Colors.white70
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autocorrect: true,
                              autofocus: false,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
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
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12),
                                hintText: "Email Address",
                                //fillColor: Colors.white70
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    obscureText: true,
                                    maxLength: 4,

                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    controller: pinController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.isEmpty) return "Enter Pin";
                                      if (text.trim().length != 4) return "4 digit Pin";
                                      pin = pinController.text;
                                      return null;
                                    },
                                    onSaved: (text) => pin = text,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      counterText: "",
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12),
                                      hintText: "Set 4 Digit PIN",
                                      //fillColor: Colors.white70
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    obscureText: true,
                                    autofocus: false,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    controller: cpinController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.isEmpty) return "Enter Pin";
                                      if (text != pinController.text)
                                        return "Pin didn't match";
                                      cpin = cpinController.text;
                                      return null;
                                    },
                                    onSaved: (text) => cpin = text,
                                    decoration: new InputDecoration(
                                      counterText: "",
                                      isDense: true,
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                                      ),
                                      filled: true,
                                      hintStyle: new TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12),
                                      hintText: "Confirm 4 digit PIN",
                                      //fillColor: Colors.white70
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormField<bool>(
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
                                            text: "I accept Fynzon's",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                                //fontFamily: 'berlinsans',
                                                color: Colors.black, fontSize: 12),
                                          ),
                                          new TextSpan(
                                            text: ' Terms of use',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue, fontSize: 12),
                                          ),
                                          TextSpan(
                                            text: ' and',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87, fontSize: 12),
                                          ),
                                          TextSpan(
                                            text: ' Privacy',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
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

                        Padding(
                          padding: EdgeInsets.only(bottom: 5, left: 40, right: 40),
                          child: _isLoading
                              ? CircularProgressIndicator(
                              strokeWidth: 6.0,
                              backgroundColor: Colors.green,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                          )
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
                              color:Color(0xFF144A7D),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Continue",
                                style: TextStyle(

                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontFamily: 'berlinsans',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 5,
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
                                          LoginScreen()),
                                );
                              },
                              child: Text('Login',style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),),
                            ),
                            Text('Support',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
