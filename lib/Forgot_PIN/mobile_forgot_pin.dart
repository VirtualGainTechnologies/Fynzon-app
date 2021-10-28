
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyn_zon/Forgot_PIN/otp_Mobile_forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../custom_appbar.dart';
import '../mainApi.dart';
import '../tokenPass.dart';
import 'forgotScreen.dart';

class MobileForgotPin extends StatefulWidget {
  const MobileForgotPin({Key key}) : super(key: key);

  @override
  _MobileForgotPinState createState() => _MobileForgotPinState();
}

class _MobileForgotPinState extends State<MobileForgotPin> {

  TextEditingController phoneController = new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String phone = "";

  Future createAlbum(String phone) async {
    setState(()=> _isLoading= true);
    var data = {
      'mobileNumber': phone,
    };

    var apiData = {
      "url": AuthToken.api + "/" +"resetPin/mobile/sendOTP",
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var getOtp = jsonDecode(onSuccess["response"]);
      var res = getOtp['data'];
      var verify_id = res['id'];
     /* print(veriid);
      AuthToken.veriotp = veriid;*/

      Fluttertoast.showToast(
          msg: "OTP Sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(()=> _isLoading= false);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OtpMobileForgot(verify_id)),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotScreen(),
          ),
        );
      },
      child: Scaffold(
        appBar: appBar('Forgot Mobile PIN'),
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
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Fynzon will send One Time OTP to verify your Mobile number",
                              textAlign: TextAlign.center,
                              style: TextStyle( fontSize: 16,
                                  //fontFamily: 'berlinsans',
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
                              autofocus: false,
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                //letterSpacing: 2
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
                                hintText: "Mobile Number",
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
                              onPressed: ()  {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  createAlbum(phoneController.text);
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

                        ],
                      ),
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


