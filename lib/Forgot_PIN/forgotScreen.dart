import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyn_zon/Forgot_PIN/email_forgot_pin.dart';
import 'package:fyn_zon/Forgot_PIN/mobile_forgot_pin.dart';
import 'package:fyn_zon/login.dart';

import '../custom_appbar.dart';
class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => LoginScreen(),
          ));
        },
      child: Scaffold(
        appBar: appBar('Forgot PIN'),
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
          ),
          padding: EdgeInsets.all(10.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("./assets/images/fynzon_logo.png",
                          height: 40,),
                        Image.asset("./assets/images/fynzon_text.png",width: 170,
                          height: 60,),

                      ])
              ),
              SizedBox(
                height: 20,
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
                        child: Text('Forgot PIN',style: TextStyle(
                          fontSize: 20,
                          //fontFamily: 'berlinsans',
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Select the method to Recover your PIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'berlinsans',
                                color: Colors.black87
                            ),),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                     /* Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailForgotPin()),
                            );
                          },
                          color:Color(0xFF81C1DF),
                          //color:Color(0xFF144A7D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Email Magic Link",
                            style: TextStyle(
                                //fontFamily: 'berlinsans',
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),*/
                      /*SizedBox(
                        height: 20,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobileForgotPin()),
                            );
                          },
                          color:Color(0xFF81C1DF),
                          //color:Color(0xFF144A7D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Mobile OTP",
                            style: TextStyle(
                                //fontFamily: 'berlinsans',

                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
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
    );
  }
}

