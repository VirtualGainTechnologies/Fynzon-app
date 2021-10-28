
import 'package:flutter/material.dart';
import 'package:fyn_zon/Wallet/eth_Wallet_Deposit.dart';
import 'package:fyn_zon/Wallet/eth_Wallet_Withdraw.dart';

import '../custom_appbar.dart';

class EthWalletDetail extends StatefulWidget {
  String currncy;
  String fName;
  String lName;
  EthWalletDetail({
    Key key,
    @required this.currncy,
    @required this.fName,
    @required this.lName,
  }) : super(key: key);
  @override
  _EthWalletDetailState createState() => _EthWalletDetailState();
}

class _EthWalletDetailState extends State<EthWalletDetail> {
  String currncy;
  String fName, lName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('ETH'),
      body: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            height: MediaQuery.of(context).size.height / 1.9,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('${widget.fName} ${widget.lName}'.toUpperCase(),style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'berlinsans',
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color:Color(0xFF81C1DF),
                      //fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WalletCurrencyQRCode( currncy: "ETH",),
                              ),
                            );*/
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ethereum',
                                    style: TextStyle(
                                      fontFamily: 'berlinsans',
                                      letterSpacing: 0.8,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Image.asset("./assets/images/wallet-2.png",scale: 11,),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "\$${widget.currncy}",
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
                              SizedBox(
                                height: 30,
                              ),

                            ],
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        height: 40,
                        minWidth: 140,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EthWalletDeposit(currncy: widget.currncy),
                            ),
                          );
                        },
                        //color:Color(0xFF81C1DF),
                        color:Color(0xFF144A7D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Deposit",
                          style: TextStyle(
                            //fontFamily: 'berlinsans',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        height: 40,
                        minWidth: 140,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EthWalletWithdraw(currncy: widget.currncy),
                            ),
                          );
                        },
                        //color:Color(0xFF81C1DF),
                        color:Color(0xFF144A7D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              //fontFamily: 'berlinsans',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
            child: Align(
              alignment: Alignment.center,
              child: Text('Transactions',style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'berlinsans',
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  color:Colors.black87
                //fontWeight: FontWeight.bold
              ),),
            ),
          ),
         SizedBox(
           height: 20,
         ),
         Expanded(child: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 1,55,65,896',
                       style: TextStyle(
                           color: Colors.red,
                         fontSize: 18
                       ),),
                     Text('25-08-2021',
                       style: TextStyle(
                           color: Colors.black,
                         fontWeight: FontWeight.bold
                       ),)
                   ],
                 ),
               ),
               Divider(
                 color: Colors.grey.shade400,
                 thickness: 0.5,
               ),
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 1,55,65,896',
                       style: TextStyle(
                           color: Colors.lightGreen,
                           fontSize: 18
                       ),),
                     Text('25-08-2021',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),)
                   ],
                 ),
               ),

               Divider(
                 color: Colors.grey.shade400,
                 thickness: 0.5,
               ),
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 1,55,65,896',
                       style: TextStyle(
                           color: Colors.red,
                           fontSize: 18
                       ),),
                     Text('25-08-2021',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),)
                   ],
                 ),
               ),
               Divider(
                 color: Colors.grey.shade400,
                 thickness: 0.5,
               ),
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 1,55,65,896',
                       style: TextStyle(
                           color: Colors.red,
                           fontSize: 18
                       ),),
                     Text('25-08-2021',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),)
                   ],
                 ),
               ),
               Divider(
                 color: Colors.grey.shade400,
                 thickness: 0.5,
               ),
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('\$ 1,55,65,896',
                       style: TextStyle(
                           color: Colors.red,
                           fontSize: 18
                       ),),
                     Text('25-08-2021',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),)
                   ],
                 ),
               ),
               Divider(
                 color: Colors.grey.shade400,
                 thickness: 0.5,
               )
             ],
           ),
         ))
        ],
      ),
    );
  }
}
