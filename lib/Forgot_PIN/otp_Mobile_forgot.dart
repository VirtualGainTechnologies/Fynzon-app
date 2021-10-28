
import 'package:flutter/material.dart';
import 'package:fyn_zon/Forgot_PIN/mobile_forgot_pin.dart';
import 'package:fyn_zon/Forgot_PIN/set_new_pin.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/pin.dart';
import 'package:fyn_zon/verifyotp.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../custom_appbar.dart';
class OtpMobileForgot extends StatefulWidget {
  @override
  String verify_id;
  OtpMobileForgot(this.verify_id);
  State<StatefulWidget> createState() {
    return _OtpMobileForgotState(this.verify_id);
  }
}

class _OtpMobileForgotState extends State<OtpMobileForgot> {
  String verify_id;
  _OtpMobileForgotState(this.verify_id);
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = new TextEditingController();
  String otp="";
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MobileForgotPin(),
          ),
        );
      },
      child: Scaffold(
        appBar: appBar('Phone Authentication'),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(10.0),

            child: Column(
              /*mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child:  Align(
                            alignment: Alignment.topLeft,
                            child: Text('Forgot PIN',style: TextStyle(
                                fontSize: 20,
                                //fontFamily: 'berlinsans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
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
                          padding: EdgeInsets.symmetric(horizontal: 70),
                          child: Text(
                            "Enter OTP sent to your mobile number",
                            textAlign: TextAlign.center,
                            style: TextStyle( fontSize: 18,
                               // fontFamily: 'berlinsans',
                                letterSpacing: 0.2,
                                color: Colors.black87),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30,right: 30),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            autocorrect: true,
                            autofillHints: [ AutofillHints.oneTimeCode ],
                            autofocus: false,
                            controller: otpController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 2
                            ),
                            validator: (text) {
                              if (text.isEmpty) return 'Please enter OTP';

                              otp = otpController.text;
                              return null;
                            },
                            onSaved: (text) => otp = text,
                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                              ),
                              filled: true,
                              hintStyle:
                              new TextStyle(
                                color: Colors.grey,
                              ),
                              hintText: "Enter your OTP",
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: _isLoading
                              ?CircularProgressIndicator(
                              strokeWidth: 6.0,
                              backgroundColor: Colors.green,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                          ):
                          MaterialButton(
                            height: 30,
                            minWidth: 110,
                            onPressed: () async {

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => _isLoading = true);
      var rsp = await forgotOtp(otp, verify_id, context);
      var data = rsp['data'];
      var error = rsp['error'];
      var message = rsp['message'];
      if (message == "Bad Inputs") {
        Fluttertoast.showToast(
            msg: rsp['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() => _isLoading = false);
      } else {
        Fluttertoast.showToast(
            msg: "Verified Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() => _isLoading = false);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                    SetNewPin(verify_id)),
        );
      }
    }

                            },
                            //color:Color(0xFF144A7D),
                            color:Color(0xFF144A7D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Continue",
                              style: TextStyle(

                                  fontSize: 16,
                                  fontFamily: 'berlinsans',
                                  color: Colors.white),
                            ),
                          ),
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

