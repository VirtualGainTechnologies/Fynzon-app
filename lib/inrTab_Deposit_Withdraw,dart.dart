
import 'package:flutter/material.dart';
import 'package:fyn_zon/deposit.dart';
import 'package:fyn_zon/withdraw.dart';

class InrTab extends StatefulWidget {
  const InrTab({Key key}) : super(key: key);

  @override
  _InrTabState createState() => _InrTabState();
}

class _InrTabState extends State<InrTab> {
  int _selectedPage = 0;
  final _pageOptions = [
    DepositPage(),
    WithdrawPage(),
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
                      text: 'Deposite',
                    ),
                    new Tab(
                      text: 'Withdraw',
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
