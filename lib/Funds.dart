import 'package:flutter/material.dart';

class FundsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FundsPageState();
  }
}

class FundsPageState extends State<FundsPage>{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Text('Funds Page' , style: TextStyle(fontSize: 36.0),),
    );
  }
}