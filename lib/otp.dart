import 'package:flutter/material.dart';
import 'package:fyn_zon/login.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'dart:convert';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/pin.dart';
import 'package:fyn_zon/verifyotp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

// ignore: must_be_immutable
class OtpPage extends StatefulWidget {
  @override
  String phone_number;
  OtpPage(this.phone_number);
  State<StatefulWidget> createState() {
    return OtpPageState(this.phone_number);
  }
}

class OtpPageState extends State<OtpPage> {
  String phone_number;
  OtpPageState(this.phone_number);
  TextEditingController otpController = new TextEditingController();
  bool _isLoading = false;
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
          msg: "OTP Get successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(()=> _isLoading= false);
    }, (onError) {
      setState(()=> _isLoading= false);
      Fluttertoast.showToast(
          msg: "Failed OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Error working with the api");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF233446),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen()),
                );
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
                                msg: "Successfully verified mobile number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(()=> _isLoading = false);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PinPage(phone_number)),
                            );

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
                        createAlbum(phone_number);
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
}
