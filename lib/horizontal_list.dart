import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyn_zon/deposit.dart';
import 'package:fyn_zon/paymentOption.dart';
import 'package:fyn_zon/services/service.dart';
import './wallet.dart';
import './withdraw.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => new _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<Service> list_service = [
    Service(
        servicename: "Deposit", serviceicon: "assets/images/fz_deposit.png"),
    Service(
        servicename: "Withdraw", serviceicon: "assets/images/fz_withdraw.png"),
    Service(servicename: "Wallet", serviceicon: "assets/images/fz_deposit.png"),
  ];

  final _pageOptions = [
    DepositPage(),
    WithdrawPage(),
    Wallet(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF203040),
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list_service.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _pageOptions[index]),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
//          elevation: 0,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(0.0),
//          ),
                        child: Column(children: <Widget>[
                          Image.asset(
                            list_service[index].serviceicon,
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            list_service[index].servicename,
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                    );
                  }),
            ),
            Center(
              child: Image.asset(
                "assets/images/fz_more.png",
                width: 80,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
