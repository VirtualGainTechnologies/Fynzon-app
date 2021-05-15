import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './first_withdrawal.dart';

class WithdrawPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WithdrawPageState();
  }
}

class WithdrawPageState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 20, 0, 10),
              child: Text('Close',style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18
              ),)),
        ),
        title: Center(
          child: Container(
            child: Text('withdraw INR',
                textAlign: TextAlign.center

            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
         // color: Color(0xFF18222C),
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Instant Withdrawal Recommended",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(

                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Wrap(children: [FirstWithdrawPage()]),
                  );

                 /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstWithdrawPage()),
                  );*/
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/fz_withdraw_withdraw.png",
                             scale: 2,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Instant Withdrawal (Recommended)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 16.0, top: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.fiber_manual_record, color: Colors.green, size: 10,),

                                          Text(
                                            "AVAILABLE",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.normal
                                            ),
                                          ),
                                        ],

                                      ),
                                    ),
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Max \u{20B9}2 lakhs per transaction | Total \u{20B9}50 lakhs Per Day | Fee Rs \u{20B9}10 per transaction.",
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /*SizedBox(
                          height: 20,
                        ),*/

                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "NEFT Withdrawal",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(

                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Wrap(children: [FirstWithdrawPage()]),
                  );
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/fz_withdraw_withdraw.png",
                              scale: 2,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "NEFT Withdrawal",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 16.0, top: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.fiber_manual_record, color: Colors.green, size: 10,),

                                          Text(
                                            "AVAILABLE",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.normal
                                            ),
                                          ),
                                        ],

                                      ),
                                    ),
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Max \u{20B9}10 lakhs per transaction | Total \u{20B9}50 lakhs Per Day | Within 30 minutes - few hours during banking hours and weekdays Fee Rs \u{20B9}5 per transaction.",
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        maxLines: 4,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /*SizedBox(
                          height: 20,
                        ),*/

                      ],
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Standard Withdrawal",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(

                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Wrap(children: [FirstWithdrawPage()]),
                  );
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.account_balance,color: Colors.grey[400],),
                            ),
                           /* Image.asset(
                              "assets/images/fz_withdraw_withdraw.png",
                              scale: 2,
                            ),*/
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Standard Withdrawal",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 16.0, top: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.fiber_manual_record, color: Colors.orangeAccent, size: 10,),

                                          Text(
                                            "TEMPORARILY UNAVAILABLE",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.orangeAccent,
                                                fontWeight: FontWeight.normal
                                            ),
                                          ),
                                        ],

                                      ),
                                    ),
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Max  \u{20B9}10 lakhs per transaction | Total  \u{20B9}50 lakhs Per Day | Within 24-28 hour during banking hours.",
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        maxLines: 4,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /*SizedBox(
                          height: 20,
                        ),*/

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
