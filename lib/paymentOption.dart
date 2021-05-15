import 'package:flutter/material.dart';
import 'package:fyn_zon/upi.dart';

import 'bankAccount.dart';
class PaymentOption extends StatefulWidget {

/* String selectedSalutation, fname, lname, dob, address, state, city, pin, pan, adhaar;
 PaymentOption({
   Key key,
   @required this.selectedSalutation,
   @required this.fname,
   @required this.lname,
   @required this.dob,
   @required this.address,
   @required this.state,
   @required this.city,
   @required this.pin,
   @required this.pan,
   @required this.adhaar,
 }) : super(key: key);*/


 @override
 State<StatefulWidget> createState() {
   return PaymentOptionState();
 }
}

class PaymentOptionState extends State<PaymentOption> {

//  String selectedSalutation, fname, lname, dob, address, state, city, pin, pan, adhaar;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deposite',textAlign: TextAlign.center),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: new DefaultTabController(
              length: 2,
              child: new Scaffold(
                appBar: new AppBar(
                  backgroundColor: Colors.white,
                  flexibleSpace: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      new TabBar(
                        tabs: [
                          new Tab(
                            text: 'BANK ACCOUNT*',
                          ),
                          new Tab(
                            text: 'UPI',
                          ),
                        ],
                        indicatorColor: Colors.green,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),

                       /* indicatorColor: Colors.green,
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blueGrey),*/
                      ),
                    ],
                  ),
                ),
                //body: _pageOptions[_selectedPage],
                body: TabBarView(
                  children: [
                    /*selectedSalutation, fname, lname, dob, address, state,
                    city, pin, pan, adhaar*/

                    BankAccount(),
                    UPI(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
