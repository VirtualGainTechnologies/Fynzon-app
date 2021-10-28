import 'dart:async';
import 'package:connectivity/connectivity.dart';
import './animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import './mainscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fynzon",
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
        decoration: new BoxDecoration(
          image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
        ),
         // color: Color(R129G193B223),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("./assets/images/fynzon_logo.png",width: 200,
                height: 70,),
                Image.asset("./assets/images/fynzon_text.png",width: 200,
                  height: 70,),
              ])),
    );
  }

  Future _getThingsOnStartup() async {

    Timer(Duration(seconds: 3), () {
       Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreenPage()));
    });
  }
}

