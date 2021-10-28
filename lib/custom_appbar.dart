
import 'package:flutter/material.dart';

Widget appBar(String text){
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: Color(0xFF203040),
    title: Text(text,
    style: TextStyle(
      fontSize: 18,
      letterSpacing: 1,
      fontWeight: FontWeight.w600
    ),
    ),
  );
}