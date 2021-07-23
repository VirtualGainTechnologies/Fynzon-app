import 'package:flutter/material.dart';
import 'package:fyn_zon/closeOrder.dart';
import 'dart:convert';
import 'package:fyn_zon/orderHistoryPage.dart';
import 'package:fyn_zon/openOrder.dart';


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
                      text: 'Open Orders',
                    ),
                    new Tab(
                      text: 'Close Orders',
                    ),
                    /*new Tab(
                      text: 'OrderHistory',
                    ),*/
                  ],
                  indicatorColor: Colors.green,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          body: _pageOptions[_selectedPage],
        ),
      ),
    );
  }
}
