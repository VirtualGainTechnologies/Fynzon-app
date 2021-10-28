import 'package:flutter/material.dart';
import 'package:fyn_zon/closeOrder.dart';
import 'dart:convert';
import 'package:fyn_zon/orderHistoryPage.dart';
import 'package:fyn_zon/openOrder.dart';

import 'mainscreen.dart';


class OrderHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderHistoryState();
  }
}

class OrderHistoryState extends State<OrderHistory> {


  int _selectedPage = 0;
  final _pageOptions = [
     OpenOrder(),
     CloseOrder(),
     //OrderHistoryMain()
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(),
      child: new DefaultTabController(
        length: 2,
        child: WillPopScope(
          onWillPop: (){
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) => MainScreenPage(),
    ),
    );
          },
          child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color(0xFF18222C),
              flexibleSpace: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new TabBar(
                    onTap: (int index) {
                      setState(() {
                        _selectedPage = index;
                      });
                    },
                    tabs: [
                      new Tab(
                        text: 'OPEN ORDERS',
                      ),
                      new Tab(
                        text: 'CLOSE ORDERS',
                      ),
                      /*new Tab(
                        text: 'OrderHistory',
                      ),*/
                    ],
                    indicatorColor: Colors.green,
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            body: _pageOptions[_selectedPage],
          ),
        ),
      ),
    );
  }
}
