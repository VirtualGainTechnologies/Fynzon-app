
import 'package:flutter/material.dart';
import 'package:fyn_zon/Forgot_PIN/otp_Mobile_forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:fyn_zon/login.dart';

import '../custom_appbar.dart';
import '../verifyotp.dart';
class SetNewPin extends StatefulWidget {

  @override
  String verify_id;
  SetNewPin(this.verify_id);
  State<StatefulWidget> createState() {
    return _SetNewPinState(this.verify_id);
  }
}

class _SetNewPinState extends State<SetNewPin> {
  String verify_id;
  _SetNewPinState(this.verify_id);
  @override
  String phone_number;
  String user_id;
  bool _isLoading = false;
  bool _passwordVisible = false;
  int _otpCodeLength = 4;
  @override
  void initState() {
    _passwordVisible = false;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController pinController = new TextEditingController();
  TextEditingController cpinController = new TextEditingController();
  String pin ="";
  String cpin ="";
  String _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpMobileForgot(verify_id),
          ),
        );
      },
      child: Scaffold(
        appBar: appBar('Set New PIN'),
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(

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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Set New PIN",
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
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "Enter 4 digit PIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'berlinsans',
                                color: Colors.black87),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        PinCodeFields(
                          length: 4,
                          fieldBorderStyle: FieldBorderStyle.Square,
                          responsive: false,
                          fieldHeight:40.0,
                          fieldWidth: 40.0,
                          borderWidth:1.0,
                          controller: pinController,
                          obscureCharacter: "*",
                          obscureText: true,
                          //activeBorderColor: Colors.pink,
                          activeBackgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          keyboardType: TextInputType.number,
                          autoHideKeyboard: true,
                          fieldBackgroundColor: Colors.white,
                          borderColor: Colors.grey.shade400,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          onComplete: (output) {
                            // Your logic with pin code
                            if (pinController.text.isEmpty)
                              return "Enter Pin";
                            if (pinController.text.trim().length != 4)
                              return "Enter Correct Pin";

                            pin = pinController.text;
                            return null;
                            print(output);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "Confirm 4 digit PIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'berlinsans',
                                color: Colors.black87),
                          ),
                        ),
                        PinCodeFields(
                          length: 4,
                          fieldBorderStyle: FieldBorderStyle.Square,
                          responsive: false,
                          fieldHeight:40.0,
                          fieldWidth: 40.0,
                          borderWidth:1.0,
                          controller: cpinController,
                          obscureCharacter: "*",
                          obscureText: true,
                          //activeBorderColor: Colors.pink,
                          activeBackgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          keyboardType: TextInputType.number,
                          autoHideKeyboard: true,
                          fieldBackgroundColor: Colors.white,
                          borderColor: Colors.grey.shade400,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                          onComplete: (output) {
                            // Your logic with pin code

                            if (cpinController.text != pinController.text)
                              return "PIN do not match";

                            cpin = cpinController.text;
                            return null;
                            print(output);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Please do not share your PIN with anyone including people from Fynzon",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
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
                          height: 10,
                        ),
                        Padding(
                          // padding: EdgeInsets.symmetric(horizontal: 40),
                          padding: EdgeInsets.only(top: 3, left: 45,right: 45,),

                          child: _isLoading
                              ?CircularProgressIndicator(
                              strokeWidth: 6.0,
                              backgroundColor: Colors.green,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                          ):
                          MaterialButton(
                            minWidth: 110,
                            height: 30,
                            onPressed: () async {
                             if (cpinController.text != pinController.text){
                               Fluttertoast.showToast(
                                   msg: "PIN do not Match",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.CENTER,
                                   timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.green,
                                   textColor: Colors.white,
                                   fontSize: 16.0);

                             } else{
                              print("lalit"+verify_id);
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() => _isLoading = true);
                                var rsp = await setNewPin(pin, verify_id, context);
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
                                      msg: rsp['message'],
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
                                            LoginScreen()),
                                  );
                                }
                              }

                            },
                            color:Color(0xFF144A7D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'berlinsans',
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
