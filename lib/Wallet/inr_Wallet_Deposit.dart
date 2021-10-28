
import 'package:flutter/material.dart';
import 'package:fyn_zon/KYC/common_api.dart';
import 'package:fyn_zon/instantDeposit.dart';

import '../custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InrWalletDeposit extends StatefulWidget {
  String currncy;
  InrWalletDeposit({
    Key key,
    @required this.currncy,
  }) : super(key: key);
  @override
  _InrWalletDepositState createState() => _InrWalletDepositState();
}

class _InrWalletDepositState extends State<InrWalletDeposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('INR Deposit'),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          /*  MaterialButton(
              height: 40,
              minWidth: 140,
              onPressed: () {
              },
              //color:Color(0xFF81C1DF),
              color:Color(0xFF144A7D),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Deposit",
                style: TextStyle(
                  //fontFamily: 'berlinsans',
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),*/
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'INR',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'berlinsans',
                            letterSpacing: 0.8,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "\u{20B9}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'berlinsans',
                                letterSpacing: 1,
                                fontSize:18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget.currncy}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'berlinsans',
                                letterSpacing: 1,
                                fontSize:20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("./assets/images/inr_deposit.png",scale: 2.8,),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () async{
                  var rsp = await response();
                  var message = rsp['message'];
                  var data = rsp['data'];
                  var record = data['record'];
                  var kycApproved = record['kycApproved'];
                  if(kycApproved == false){
                    Fluttertoast.showToast(
                        msg:  "KYC not Approved",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 18.0);
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InstantDeposit()),
                    );
                  }



                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      InstantDeposit()));*/
                },
                //color:Color(0xFF81C1DF),
                color:Color(0xFF144A7D),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "PROCEED",
                  style: TextStyle(
                    //fontFamily: 'berlinsans',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
