import 'package:flutter/material.dart';
import 'package:fyn_zon/login.dart';
class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController otpController = new TextEditingController();
  bool _isLoading = false;
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
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 22),
                child: Icon(Icons.arrow_back,color: Colors.white,),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.vpn_key,color: Colors.white,),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: Text(
                        "Please enter your registered email",
                        style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 45,right: 45),
                      child: TextFormField(
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
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          hintText: "Email",
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
                        },
                        color: Colors.blueGrey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "RESET PASSWORD",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.white),
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
    );
  }
}

