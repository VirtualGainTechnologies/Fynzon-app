

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fyn_zon/Wallet/wallet.dart';
import 'package:fyn_zon/closeOrder.dart';
import 'package:fyn_zon/openOrder.dart';
import 'BuySell.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'mainscreen.dart';
import 'orderHistoryPage.dart';
class EthDetailPage extends StatefulWidget {
  String base, tread;
  var price;


  EthDetailPage({
    Key key,
    @required this.base,
    @required this.tread,
    @required this.price,
  }) : super(key: key);
  @override
  _EthDetailPageState createState() => _EthDetailPageState();
}

class _EthDetailPageState extends State<EthDetailPage> {

  int _selectedPage = 0;
  final _pageOptions = [
    OpenOrder(),
    CloseOrder()
  ];

  @override
  Widget build(BuildContext context) {

    final _bottomNav = BottomAppBar(
      shape: CircularNotchedRectangle(),
       notchMargin: 6,
       clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        //backgroundColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/fz_order.png"),
              ),
              title: Text(
                "OPEN ORDER",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/fz_funds.png"),
              ),
              title: Text(
                "CLOSE ORDER",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
    final _fab = Container(
      height: 65.0,
      width: 65.0,
      child: FittedBox(
        child: FloatingActionButton(
          child: Image.asset("./assets/images/fynzon logo circle-2.png",fit: BoxFit.cover,),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              enableDrag: true,
              context: context,
              builder: (context) => SafeArea(
                child: Container(
                    height: MediaQuery.of(context).size.height / 1.9 +
                        MediaQuery.of(context).viewInsets.bottom,
                    child: BuySell( base: widget.base,
                    tread: widget.tread,
                    price: widget.price.toString(),)),
              ),
            );
          },
        ),
      ),
    );



    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreenPage()),
        );
        setState(() {

        });
      },
        child: Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: <Widget>[
              Text(
                widget.tread,
                style:
                TextStyle(color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '/',
                style:
                TextStyle(color: Colors.grey[500],
                  fontSize: 14,
                  letterSpacing: 2,
                ),
              ),
              Text(
                widget.base,
                style:
                TextStyle(color: Colors.grey[500],
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
                alignment: Alignment.center,
                child: Text('₹ ${widget.price.toString()}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600
                  ),)),
          )
        ],
      ),
      body: _pageOptions[_selectedPage],
          floatingActionButton: _fab,
          bottomNavigationBar: _bottomNav,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    ),
    );
  }
}