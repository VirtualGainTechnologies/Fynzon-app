import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondWithdrawPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondWithdrawPageState();
  }
}

class SecondWithdrawPageState extends State<SecondWithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.8,
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Container(
                   alignment: Alignment.topRight,
                  child: Icon(Icons.close,color: Colors.grey,),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Withdraw amount",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 0.3,),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 10),
                            child: Text(
                              "0.00INR",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Pay to bank ****1234 ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 8, bottom: 8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey[400]),
                                hintText: "Enter Amount",
                                fillColor: Colors.white70),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[400]),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("+ 1000 INR",style: TextStyle(color: Colors.grey[400]),),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[400]),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("+ 5000 INR",style: TextStyle(color: Colors.grey[400]),),
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[400]),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("+ 10000 INR",style: TextStyle(color: Colors.grey[400]),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0,right: 40),
                        child: Text(
                          "10.00 INR will  be charged on every transaction",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Proceed to Withdraw",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(

                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0)), //this right here
                                    child: Container(
                                      color: Colors.blueAccent,
                                      height: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           Text('Amount will be credited to your Below registered bank account',style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 18
                                           ),),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      child: Text('Bank name:  '
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15
                                                        ),)),
                                                  Container(
                                                      child: Text('STATE BANK OF INDIA'
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16
                                                        ),)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      child: Text('Name:  '
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15
                                                        ),)),
                                                  Container(
                                                      child: Text('Bank Withdrawal'
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16
                                                        ),)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      child: Text('Account Number:  '
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15
                                                        ),)),
                                                  Container(
                                                      child: Text('1275459658'
                                                        ,style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16
                                                        ),)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                    child: RaisedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Ok",
                                                        style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Cancle",
                                                        style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
