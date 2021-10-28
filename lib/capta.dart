
import 'package:flutter/material.dart';
import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';

class Capta extends StatefulWidget {
  const Capta({Key key}) : super(key: key);

  @override
  _CaptaState createState() => _CaptaState();
}

class _CaptaState extends State<Capta> {
  String verifyResult = "";

  bool verify = false;

  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  @override
  void initState() {
     recaptchaV2Controller.show();
    // _showDialog();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capta'),
      ),
      body: Container(

        child: RecaptchaV2(
          apiKey: "6LeCwZYUAAAAAJo8IVvGX9dH65Rw89vxaxErCeou",
          apiSecret: "6LeCwZYUAAAAAKGahIjwfOARevvRETgvwhPMKCs_",
          controller: recaptchaV2Controller,
          onVerifiedError: (err){
            Fluttertoast.showToast(
                msg: err,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          onVerifiedSuccessfully: (success) {
            setState(() {
              if (success) {
                setState(() {
                  verify = true;
                });
                Fluttertoast.showToast(
                    msg: "You've been verified successfully.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()));
              } else {
                setState(() {
                  verify = false;
                });
                Fluttertoast.showToast(
                    msg: "Failed to verify.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            });
          },
        ),
      ),
    );
  }
}
