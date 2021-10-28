
import 'package:flutter/material.dart';

class InrWalletWithdraw extends StatefulWidget {
  String currncy;
  InrWalletWithdraw({
    Key key,
    @required this.currncy,
  }) : super(key: key);
  @override
  _InrWalletWithdrawState createState() => _InrWalletWithdrawState();
}

class _InrWalletWithdrawState extends State<InrWalletWithdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            MaterialButton(
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
                "Withdraw",
                style: TextStyle(
                  //fontFamily: 'berlinsans',
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\$${widget.currncy}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'berlinsans',
                            letterSpacing: 1,
                            fontSize:40,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset("./assets/images/inr_wallet_2.png",scale: 2.8,),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {

                },
                //color:Color(0xFF81C1DF),
                color:Color(0xFF144A7D),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Next",
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
