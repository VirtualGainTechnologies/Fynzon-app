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
    MarketDepth(),
    OrderPage(),

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
                    new Tab(text: 'Market Depth',),
                    new Tab(text: 'Order Volume',),
                  ],
                  indicatorColor: Colors.green,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
