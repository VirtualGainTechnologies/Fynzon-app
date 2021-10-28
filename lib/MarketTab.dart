import 'package:flutter/material.dart';
import 'package:fyn_zon/MarketINR.dart';
import './Markets.dart';
import 'MarketBTC.dart';

class MarketsTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MarketsTabPageState();
  }
}

class MarketsTabPageState extends State<MarketsTabPage> {

  int _selectedPage = 0;
  final _pageOptions = [
    MarketINR(),
    MarketsPage(),
    MarketBTC(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: new DefaultTabController(
        length: 3,
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
                    new Tab(text: 'INR'),
                    new Tab(text: 'USDT',),
                    new Tab(text: 'BTC'),
                  ],
                  indicatorColor: Colors.green,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 16),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
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

