import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import './postQRCode.dart';
import './mainScreen.dart';

class QRCodeDigit extends StatefulWidget {
  @override
  _QRCodeDigitState createState() => _QRCodeDigitState();
}

class _QRCodeDigitState extends State<QRCodeDigit> {
  TextEditingController qrController = new TextEditingController();
  @override
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
                    "QR-Code",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your QR-Code",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: PinInputTextField(
                      pinLength: 6,
                      controller: qrController,

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
                        onPressed: () {
                          var qr = qrController.text;

                          QRPass.qrCode(qr, context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreenPage()),
                          );
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
