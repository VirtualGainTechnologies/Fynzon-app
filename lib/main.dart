import 'dart:async';
import 'package:fyn_zon/text.dart';
import 'package:fyn_zon/wallet.dart';
import './animation/FadeAnimation.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './mainscreen.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _getThingsOnStartup();
    super.initState();
  }

  Widget build(BuildContext context) {
    return FadeAnimation(
      2.5,
      Container(
          padding: EdgeInsets.all(40),
          color: Color(0xFF18222C),
          child: Image.asset("./assets/fynzon_logo.png")),
    );
  }

  Future _getThingsOnStartup() async {
    final prefs = await SharedPreferences.getInstance();
    prefs?.setBool("isLoggedIn", true);
    final user = prefs.getString("userid");
    AuthToken.userid = user;
    final token = prefs.getString("token");
    AuthToken.authtoken = token;
    print(user);
    Timer(Duration(seconds: 3), () {
     // Navigator.pushNamed(context, '/mainScreenPage');
       Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreenPage()));
      /*if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreenPage()));
      }*/
    });
  }
}
