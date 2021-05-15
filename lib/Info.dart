import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoPageState();
  }
}

class InfoPageState extends State<InfoPage>{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Text('Info Page' , style: TextStyle(fontSize: 36.0),),
    );
  }
}