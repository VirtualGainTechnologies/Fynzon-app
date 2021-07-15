import 'package:flutter/material.dart';
import 'package:fyn_zon/btcwalletQRCode.dart';
import 'package:fyn_zon/withdraw_Currency.dart';

class WalletCurrencyQRCode extends StatefulWidget {
  String currncy;
  WalletCurrencyQRCode({
    Key key,
    @required this.currncy,
  }) : super(key: key);


  @override
  _WalletCurrencyQRCodeState createState() => _WalletCurrencyQRCodeState();
}

class _WalletCurrencyQRCodeState extends State<WalletCurrencyQRCode> {
  String currncy;

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
                 /* onTap: (int index) {
                    setState(() {
                      _selectedPage = index;
                    });
                  },*/
                  tabs: [
                    new Tab(text: 'Deposit',),
                    new Tab(text: 'Withdraw',),
                  ],
                  indicatorColor: Colors.green,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,letterSpacing: 1,fontSize: 16),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              WalletQRCode(currncy: widget.currncy),
              CurrencyWithdraw(currncy: widget.currncy),
            ],
          ),
        ),
      ),
    );
  }
}