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
    MarketsPage(),
    MarketBTC(),
    MarketINR(),
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
                    new Tab(text: 'USDT',),
                    new Tab(text: 'BTC',),
                    new Tab(text: 'INR'),
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
}

