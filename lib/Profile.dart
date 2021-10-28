import 'package:flutter/material.dart';
import 'package:fyn_zon/marketdepth.dart';
import './orderPage.dart';
import './login.dart';
import './tokenPass.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{
  int _selectedPage = 0;
  final _pageOptions = [
    OrderPage(),
    MarketDepth(),

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
                    new Tab(text: 'ORDER VOLUME',),
                    new Tab(text: 'MARKET DEPTH',),
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
    );
  }
  //Future _getThingsOnStartup()
}
