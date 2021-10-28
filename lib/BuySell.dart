import 'package:flutter/material.dart';
import 'package:fyn_zon/sale.dart';
import './Buy.dart';

class BuySell extends StatefulWidget {
  String base, tread;
  var price;


  BuySell({
    Key key,
    @required this.base,
    @required this.tread,
    @required this.price,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BuySellState();
  }
}

class BuySellState extends State<BuySell> {
  String base, tread;
  var price;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: new DefaultTabController(
          length: 2,
          child: new Scaffold(
            appBar: new AppBar(
              automaticallyImplyLeading: false,
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
                      new Tab(
                        text: 'BUY',
                      ),
                      new Tab(
                        text: 'SELL',
                      ),
                    ],
                    indicatorColor: Color(0xFF233446),
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            //body: _pageOptions[_selectedPage],
            body: TabBarView(
              children: [
                BuyPage(base: widget.base, tread: widget.tread, price: widget.price),
                SalePage(base: widget.base, tread: widget.tread, price: widget.price),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
