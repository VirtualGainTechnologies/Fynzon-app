
import 'package:flutter/material.dart';
import 'package:fyn_zon/Asset/assetsWithdraw.dart';
import 'package:fyn_zon/wallet.dart';

class Assets extends StatefulWidget {
  const Assets({Key key}) : super(key: key);

  @override
  _AssetsState createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  int _selectedPage = 0;
  final _pageOptions = [
    Wallet(),
    AssetsWithdraw(),
    //OrderHistoryMain()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF18222C),
        title: Text('Assets'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(),
        child: new DefaultTabController(
          length: 2,
          child: new Scaffold(
            appBar: new AppBar(
              leading: Icon(null),
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
                        text: 'Assets',
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
      ),
    );
  }
}
