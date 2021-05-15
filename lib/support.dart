import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyn_zon/security.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF18222C),
        title: Image.asset("./assets/fynzon_logo.png",scale: 27.0,),
        actions: [
          FlatButton(
            color: Colors.yellow,
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Security()),
              );
            },
            child: Text("CONTACT US",textScaleFactor: 0.9,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
             // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 360,
              //color: Color(0xFF18222C),
              color: Color(0xFF357ABD),
              child: Stack(
                     children: [
                       Container(

                         alignment: Alignment.center,
                         child: Text('Hi! How can we help?',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 26.0,

                         ),),
                       ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10),
                        //alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 210, left: 30, right: 30),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: 'Search',
                              icon: Icon(Icons.search),
                              focusColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,

                          ),
                        ),
                      )
                     ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Categories',
              style: TextStyle(
                fontSize: 20.0
              ),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                 // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_inr.png", scale: 1.1,),
                    Text('INR Deposit & Withdrawal',
                    style: TextStyle(
                      fontSize: 16,
                    ),),

                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_signup.png", scale: 1.5,),
                    Text('Signing Up & Account Management',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Image.asset("./assets/images/fz_cryptocurrency.png", scale: 1,),
                    Text('Cryptocurrency Deposit & Withdrawal',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_treadingfee.png", scale: 1,),
                    Text('Trading & Fees',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_p2p.png", scale: 1,),
                    Text('P2P',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Icon(Icons.search),
                    Text('Smart Token Fund (STF)',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search),
                    Text('WRX Coin',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_security.png", scale: 0.9,),
                    Text('Security',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxi  sSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_general.png", scale: 0.9,),
                    Text('General',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110.0,
              margin: EdgeInsets.only( top: 20.0,left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("./assets/images/fz_announcemnt.png", scale: 2,),
                    Text('Announcements',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Popular Articles',
                style: TextStyle(
                    fontSize: 20.0
                ),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,),
             // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
               children: [
                 GestureDetector(
                   onTap: () {
                       print("hello");
                   },
                   child: Text(
                     'How to find transection ID in UPI Apps or for payments done via IMPS/NEFT/RTGS?',
                     style: TextStyle(
                         fontSize: 16
                     ),
                   ),
                 ),
                 Divider(

                   color: Colors.grey,

                 )
               ],
              ),

            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Deposit INR to your FynZon account - Process & Time Taken',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Withdraw INR from your FynZon account - Process & Time taken',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'My INR deposit got rejected. What should I do?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Guide to Signing Up & KYC Verification',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon Referral Program - Participation, Tracking & Rules',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Can foreign nationals create an account on FynZon?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Transfer funds between FynZon and Binance account',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Deposit/Receive Cryptocurrency to your FynZon account - Process & Time Taken',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Withdraw/Send Cryptocurrency from your FynZon account - Process & Time Taken',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Trading, Deposit & Withdrawal Fees',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Deposit Dhamaka Program FAQs!',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon P2P - How it Works?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'How to Buy USDT on FynZon P2P?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'How to Sell USDT on FynZon P2P?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ), Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'What is Smart Token Fund (STF)?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'STF Investor - How to Buy an STF?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'STF Investor - How to Sell an STF?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'STF Trader - Accounts & Funds Management',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Using FynZon to Pay Trading Fees',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon Release Schedule + Sign Up Bonus Update',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon Mining - Unlock & Earn upto 10,000 FynZon Coins Daily!',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon - Coin Details & How to earn',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'What is my FynZon balance?',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Two-Factor Authentication (2FA) - Setup, Change & Recovery',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Securing your FynZon account - Tips & Best Practices',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Update on FynZon circulating supply',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'The Twitter hack - how to keep your funds safe',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'BitTorrent foundation ends BTT airdrops to TRX holders',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon Gets Successfully Acquired By Binance',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20,),
              // margin: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'FynZon   Trading Deposit & Withdrawal Fees',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
