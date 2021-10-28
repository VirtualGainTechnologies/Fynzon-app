import 'package:flutter/material.dart';
import 'package:fyn_zon/login.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/pin.dart';
import 'package:fyn_zon/verifyotp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';

import 'custom_appbar.dart';

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
  bool _isLoading1 = false;

  @override
  void initState() {
    super.initState();
    number();
  }

 void number(){
   String replaceCharAt(String oldString, int index, String newChar) {
     return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
   }
   for(int i=0; i<8;i++){
     phone_number = replaceCharAt(phone_number, i, "*") ;
     print("PHONE_NUMBER_LOOP:$phone_number");

   }

   print("FinalNumber:$phone_number");
 }


  Future createAlbum(String phone) async {
    setState(()=> _isLoading1= true);
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
      setState(()=> _isLoading1= false);
    }, (onError) {
      setState(()=> _isLoading1= false);
      Fluttertoast.showToast(
          msg: "Verification Failed",
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
                 child: Column(
                   children: [
                     Padding(
                       padding: EdgeInsets.all(15),
                       child: Align(
                         alignment: Alignment.topLeft,
                         child: Text(
                           "Verify Mobile Number",
                           style: TextStyle(
                               fontSize: 17,
                               fontWeight: FontWeight.w600,
                               color: Colors.black,
                             //fontFamily: 'berlinsans',
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
                       height: 50,
                     ),
                     Image.asset("./assets/images/security.png",width: 170,
                       height: 60,),
                     SizedBox(
                       height: 30,
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 40),
                       child: Text(
                         "Please Enter the verification code sent to",
                         textAlign: TextAlign.center,
                         style: TextStyle( fontSize: 15,
                             //fontFamily: 'berlinsans',
                             letterSpacing: 0.6,
                             color: Colors.black),
                       ),
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Text(
                       "+91 $phone_number",
                       textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 20,
                           color: Colors.black,
                           fontFamily: 'berlinsans',
                       letterSpacing: 3,),
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
                           hintText: "Enter Verification Code",
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
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
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
                               FocusScope.of(context).requestFocus(FocusNode());
                               setState(()=> _isLoading = true);
                               var otp = otpController.text;
                               var rsp = await aAlbum(otp, context);
                               var data = rsp['data'];
                               var error = rsp['error'];
                               if (error == "true"){
                                 Fluttertoast.showToast(
                                     msg: "verification failed",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.red,
                                     textColor: Colors.white,
                                     fontSize: 16.0);
                                 setState(()=> _isLoading = false);
                               }else{
                                 Fluttertoast.showToast(
                                     msg: "verified Successfully ",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.green,
                                     textColor: Colors.white,
                                     fontSize: 16.0);
                                 setState(()=> _isLoading = false);
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => PinPage(widget.phone_number)),
                                 );

                               }

                             },
                             //color:Color(0xFF144A7D),
                             color:Color(0xFF144A7D),
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(5)),
                             child: Text(
                               "Verify",
                               style: TextStyle(

                                   fontSize: 16,
                                   fontWeight: FontWeight.w600,
                                   //fontFamily: 'berlinsans',
                                   color: Colors.white),
                             ),
                           ),
                         ),



                         Container(
                           child: _isLoading1
                               ?CircularProgressIndicator(
                               strokeWidth: 6.0,
                               backgroundColor: Colors.green,
                               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                           ):
                           MaterialButton(
                             height: 30,
                             minWidth: 110,
                             onPressed: () async {
                               createAlbum(widget.phone_number);
                             },
                             color:Color(0xFF144A7D),
                             //color: Colors.blue,
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(5)),
                             child: Text(
                               "Resend",
                               style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 16,
                                   color: Colors.white),
                             ),
                           ),
                         ),
                       ],
                     ),

                     SizedBox(
                       height: 20,
                     ),
                   ],
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
