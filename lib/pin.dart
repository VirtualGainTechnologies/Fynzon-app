import 'package:flutter/material.dart';
import 'package:fyn_zon/api/api.dart';
import 'package:fyn_zon/otp.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/login.dart';
import './mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinPage extends StatefulWidget {
  @override
  String phone_number;
  PinPage(this.phone_number);
  State<StatefulWidget> createState() {
    return PinPageState(this.phone_number);
  }
}

class PinPageState extends State<PinPage> {
  @override
  String phone_number;
  var user_id;
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final globalKey = GlobalKey<ScaffoldState>();
  PinPageState(this.phone_number);
  TextEditingController pinController = new TextEditingController();
  void showInSnackBar() {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        'User not Exits',
        style: TextStyle(color: Colors.red),
      ),
      duration: new Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
    ));
  }

  void showInSnackBar1() {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        'Successfully Logged In',
        style: TextStyle(color: Colors.red),
      ),
      duration: new Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
    ));
  }
  void _moveToSignInScreen(BuildContext context) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //Navigator.pop(context);
        _moveToSignInScreen(context);
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Color(0xFF233446),
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
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
                          "Please enter your PIN",
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
                          controller: pinController,
                          keyboardType: TextInputType.number,
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
                            hintText: "PIN",
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
                            setState(()=> _isLoading = true);
                            FocusScope.of(context).requestFocus(FocusNode());
                            var pin = pinController.text;

                            var rsp = await loginUser(phone_number, pin);
                            var data = rsp['data'];
                            var error = rsp['error'];
                            if (error == "true") {
                              showInSnackBar();
                              setState(()=> _isLoading = false);
                            } else {
                              showInSnackBar1();
                              user_id = data['userid'];
                              //AuthToken.userid = data['userid'];
                              var token = data['token'];
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              print('user id' + user_id);
                              AuthToken.authtoken = token;
                              AuthToken.userid = user_id;
                              print('logintoken>>>>>>>>>' + AuthToken.authtoken);
                              setState(() {
                                prefs.setString('userid', user_id);
                                prefs.setString('token', token);
                                setState(()=> _isLoading = false);
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreenPage()),
                                );
                              });

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
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}


/*
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(0xFF18222C),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
              2.5,
               Image.asset(
                "./assets/fynzon_logo.png",
                height: 80,
                width: 200,
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.all(10),
                child: FadeAnimation(
                  2.5,
                   Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "PIN",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Please enter your PIN",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: PinInputTextField(
                          pinLength: 4,
                          controller: pinController,

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 40,right: 40,),
                        child: _isLoading
                            ?CircularProgressIndicator()
                            :
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            setState(()=> _isLoading = true);
                            FocusScope.of(context).requestFocus(FocusNode());
                            var pin = pinController.text;

                            var rsp = await loginUser(phone_number, pin);
                            var data = rsp['data'];
                            var error = rsp['error'];
                            if (error == "true") {
                              showInSnackBar();
                              setState(()=> _isLoading = false);
                            } else {
                              showInSnackBar1();
                              user_id = data['userid'];
                              //AuthToken.userid = data['userid'];
                              var token = data['token'];
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              print('user id' + user_id);
                              AuthToken.authtoken = token;
                              AuthToken.userid = user_id;
                              print('logintoken>>>>>>>>>' + AuthToken.authtoken);
                              setState(() {
                                prefs.setString('userid', user_id);
                                prefs.setString('token', token);
                                setState(()=> _isLoading = false);
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreenPage()),
                                );
                              });
                             
                            }
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
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
