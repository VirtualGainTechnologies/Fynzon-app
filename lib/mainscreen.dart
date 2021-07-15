
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyn_zon/Profile.dart';
import 'package:fyn_zon/api/api.dart';
import 'package:fyn_zon/deposit.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/wallet.dart';
import 'package:fyn_zon/dBar.dart';
import 'package:fyn_zon/withdraw.dart';
import './MarketTab.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import './orderHistory.dart';
import 'mainApi.dart';
import 'orderHistoryPage.dart';

class HomePage {
  String message;
  String error;
  Data data;

  HomePage({this.message, this.error, this.data});

  HomePage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String country;
  String panImage;
  String adhaarImage;
  String adhaarBackImage;
  bool updateMainNetBalance;
  bool kycApproved;
  String sId;
  int phone;
  String fname;
  String mname;
  String lname;
  String email;
  String pin;
  String accType;
  String bankAccNo;
  String ifscCode;

  Data(
      {this.country,
        this.panImage,
        this.adhaarImage,
        this.adhaarBackImage,
        this.updateMainNetBalance,
        this.kycApproved,
        this.sId,
        this.phone,
        this.fname,
        this.mname,
        this.lname,
        this.email,
        this.pin,
        this.accType,
        this.bankAccNo,
        this.ifscCode});

  Data.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    panImage = json['panImage'];
    adhaarImage = json['adhaarImage'];
    adhaarBackImage = json['adhaarBackImage'];
    updateMainNetBalance = json['updateMainNetBalance'];
    kycApproved = json['kycApproved'];
    sId = json['_id'];
    phone = json['phone'];
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    email = json['email'];
    pin = json['pin'];
    accType = json['accType'];
    bankAccNo = json['bankAccNo'];
    ifscCode = json['ifscCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['panImage'] = this.panImage;
    data['adhaarImage'] = this.adhaarImage;
    data['adhaarBackImage'] = this.adhaarBackImage;
    data['updateMainNetBalance'] = this.updateMainNetBalance;
    data['kycApproved'] = this.kycApproved;
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['fname'] = this.fname;
    data['mname'] = this.mname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['pin'] = this.pin;
    data['accType'] = this.accType;
    data['bankAccNo'] = this.bankAccNo;
    data['ifscCode'] = this.ifscCode;
    return data;
  }
}

class MainScreenPage extends StatefulWidget {
  @override
  MainScreenState createState() => new MainScreenState();

}

class MainScreenState extends State<MainScreenPage> {
  int _selectedPage = 0;
  final _pageOptions = [
    MarketsTabPage(),
    ProfilePage(),
    OrderHistory(),
    OrderHistoryMain()
  ];
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  HomePage futureAlbum;
  /*@override
  void initState() {
    super.initState();
    fetchAlbum1();
    setState(() {

    });
  }*/
  Future<void> main() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs?.clear();
    prefs.remove('token');
    prefs.remove('userid');
    /* AuthToken.authtoken = null;
    AuthToken.userid = null;*/
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: MainScreenPage(),
      ),
    );   /* Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>MainScreenPage()
    ));*/
        (Route route) => false;
  }
  var userid;
  Future<void> fetchAlbum1() async {
    /* var data = {

    };*/
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('userid');
    });
    var apiData = {
      "url": AuthToken.api + "/" + "client/userDetails/"+ prefs.getString('token'),
      //"data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      futureAlbum = HomePage.fromJson(jsonDecode(onSuccess['response']));
      print("walletqrcode>>>>>>> " + futureAlbum.data.phone.toString());
      //print("walletqrcode>>>>>>> " + futureAlbum.message.toString());
      //print(futureAlbum.message);
      setState(() {
      });
    }, (onError) {
      print(onError);
    });
  }

  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };

    MaterialColor colorCustom = MaterialColor(0xFF203040, color);
    return WillPopScope(
      onWillPop: (){
        //Navigator.pop(context);
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blueGrey,
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit Application?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES",style: TextStyle(
                      color: Colors.white
                    ),),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: Text("NO",style: TextStyle(
                        color: Colors.white
                    ),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
        );

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fynzon',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        home:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            leading: GestureDetector(
              onTap:() {
                //fetchAlbum1();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dbar(),
                    ),
                  );

                },

              child: Container(
                child: Icon(Icons.supervised_user_circle_outlined,color: Colors.white,),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(right: 0),
              child: Image.asset(
                "./assets/fynzon_logo.png",
                width: 110,
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Icon(Icons.search,color: Colors.white,),
              ),
            ],
          ),

          //  body: _pageOptions[_selectedPage],
          body:
          Container(
            color: Color(0xFF203040),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                  //child: FadeAnimation(2.5,HorizontalList()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepositPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset("assets/images/fz_deposit.png",scale: 2,),
                              Text('Deposite',style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset("assets/images/fz_withdraw.png",scale: 2,),
                              Text('Withdraw',style: TextStyle(
                                  color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wallet(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset("assets/images/wallet.png",scale: 24,),
                              Text('Wallet',style: TextStyle(
                                  color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                ),
                Expanded(
                  child: _pageOptions[_selectedPage],
                )
              ],
            ),
          ),

          bottomNavigationBar: SafeArea(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Color(0xFF18222C),
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
               /* BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/fz_info.png"),
                    ),
                    title: Text(
                      "Info",
                      style: TextStyle(color: Colors.white),
                    )),*/
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/fz_market.png"),
                    ),
                    title: Text(
                      "Markets",
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/fz_order.png"),
                    ),
                    title: Text(
                      "Orders",
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/fz_funds.png"),
                  ),
                  title: Text(
                    "Order History",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/fz_funds.png"),
                  ),
                  title: Text(
                    "Trade History",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
       /* StreamProvider<NetworkStatus>(
          create: (context) =>
          NetworkStatusService().networkStatusController.stream,
          child: NetworkAwareWidget(
            onlineChild:
            offlineChild: Container(
              child: Center(
                child: Text(
                  "No internet connection!",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),*/


      ),
    );
  }
}
