import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyn_zon/mainscreen.dart';
import './signup.dart';
import './otp.dart';
import 'dart:convert';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/forgotScreen.dart';
import './animation/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  String phone = "";
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
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OtpPage(phoneController.text)),
      );

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     // backgroundColor: Colors.white,
      body: Container(
        color: Color(0xFF233446),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.0),
        width: double.infinity,

        child: Form(
          key: _formKey,
            child: FadeAnimation(
              2.5, Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainScreenPage()),
                    );
                  },
                  child: Container(alignment: Alignment.topRight,
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40, top: 00),
                          child: Image.asset(
                            "./assets/fynzon_logo.png",
                            height: 80,
                            width: 200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: FadeAnimation(
                            2.5,
                            Column(
                              children: <Widget>[
                                TextFormField(
                                  autocorrect: true,
                                  autofocus: false,
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  validator: (text) {
                                    if (text.trim().length < 10)
                                      return "Mobile Number Should not be blank.";
                                    phone = phoneController.text;
                                    return null;
                                  },
                                  onSaved: (text) => phone = text,
                                  decoration: new InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueGrey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueGrey),),
                                    filled: true,
                                    hintStyle:
                                    new TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                    hintText: "Mobile Number",
                                    // fillColor: Colors.white70
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 20),
                            child: _isLoading
                                ?CircularProgressIndicator()
                                : MaterialButton(
                              minWidth: double.infinity,
                              height: 40,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  //Navigator.pop(context);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  createAlbum(phoneController.text);
                                  /* Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              OtpPage(phoneController.text)),
                                                    );*/
                                }
                              },
                              color: Colors.blueGrey,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotScreen()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                           // margin: EdgeInsets.only(top: 15),
                            child: Text('Forgot Password?',style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 140,
                                child: Divider(
                                  thickness: 0.4,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Container(
                                width: 20,
                                child: Text(
                                  "OR"                               ),
                              ),
                              Container(
                                width: 140,
                                child: Divider(
                                  thickness: 0.4,
                                  color: Colors.blueGrey,
                                ),
                              ),


                            ],
                          ),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 20),
                            child
                                : MaterialButton(
                              minWidth: double.infinity,
                              height: 40,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignupPage()),
                                );

                              },
                              color: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
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

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
      ),
    ],
  );
}
