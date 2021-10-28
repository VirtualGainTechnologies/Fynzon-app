import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyn_zon/KYC/adharCard.dart';
import 'package:fyn_zon/Profile.dart';
import 'package:fyn_zon/assets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/deposit.dart';
import 'package:fyn_zon/login.dart';
import 'package:fyn_zon/signup.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/Wallet/wallet.dart';
import 'package:fyn_zon/update_new_bank.dart';
import 'package:fyn_zon/update_user_profile.dart';
import 'package:fyn_zon/withdraw.dart';
import './MarketTab.dart';
import 'package:flutter/services.dart';
import './orderHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'KYC/common_api.dart';
import 'KYC/firstkyc.dart';
import 'MarketINR.dart';
import 'mainApi.dart';
import 'orderHistoryPage.dart';

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

  var fName;
  var lName;
  var email;
  @override
  void initState() {
    super.initState();
    share_Data();
    fetchInr();
  }
  share_Data() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fName = prefs.getString("fname");
      lName = prefs.getString("lname");
      email = prefs.getString("email");
    });
  }

  var user_id;
  INRModel fetchModal;
  fetchInr() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("userid");
    });
    // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};
    var apiData = {"url": AuthToken.api + "/" + "v2/market/?baseCurrency=INR",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal = INRModel.fromJson(jsonDecode(onSuccess['response']));
      print("lalitinit>>>>>>> " + fetchModal.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
  Future<void> main() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs?.clear();
    prefs.remove('token');
    prefs.remove('userid');
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreenPage(),
      ),
    );
        (Route route) => false;
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {

    final _bottomNav = BottomAppBar(
      shape: CircularNotchedRectangle(),
     // notchMargin: 6,
     // clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        //backgroundColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/fz_market.png"),
              ),
              title: Text(
                "MARKETS",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/fz_order.png"),
              ),
              title: Text(
                "ORDERS",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              )),

          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/fz_funds.png"),
            ),
            title: Text(
              "TRADE",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/fz_funds.png"),
            ),
            title: Text(
              "HISTORY",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

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
    return RefreshIndicator(
      onRefresh: () async {
        Completer<Null> completer = new Completer<Null>();
        await Future.delayed(Duration(seconds: 2)).then((onvalue) {
          completer.complete();
          setState(() {
            print('refresed');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          });
        });
        return completer.future;
      },

      child: WillPopScope(
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
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            drawer: dBar(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120.0),
              child: AppBar(
                leading: IconButton(
                  icon: Image.asset(
                    "./assets/images/fz_user.png",
                    scale: 16,
                  ),
                  onPressed: () {
                    get_User();
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
               // automaticallyImplyLeading: false,
                title: Container(
                  padding: EdgeInsets.only(right: 0),
                  child: Image.asset(
                    "./assets/fynzon_logo.png",
                    width: 110,

                  ),
                ),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 20,top: 3),
                      child: Icon(Icons.notifications,color: Colors.white,size: 23,),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 12,left: 20,right: 20),
                      //height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Image.asset("assets/homeimage/deposit button.png",scale: 15,),
                                  Text('DEPOSIT',style: TextStyle(
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
                                  Image.asset("assets/homeimage/wallet button.png",scale: 17,),
                                  Text('WALLET',style: TextStyle(
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
                                  Image.asset("assets/homeimage/withdraw button.png",scale: 17,),
                                  Text('WITHDRAW',style: TextStyle(
                                      color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WithdrawPage(),
                              ),
                            );*/
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Image.asset("assets/homeimage/more button.png",scale: 15,),
                                  Text('MORE',style: TextStyle(
                                      color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    preferredSize: Size.fromHeight(10.0)),
              ),
            ),
            body:
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: _pageOptions[_selectedPage],
                  )
                ],
              ),
            ),
            bottomNavigationBar: _bottomNav,
          ),
        ),
      ),
    );
  }

   var images;

  get_User()async{
    var rsp = await getUser();
    var message = rsp['message'];
    var data = rsp['data'];
    var record = data['record'];
    var error = rsp['error'];
    if(error == "true"){
      print("failed $error");
     /* Fluttertoast.showToast(
          msg:  message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);*/

    }else{
      setState(() {
        images = record['image_URL'].toString();
      });
     /* Fluttertoast.showToast(
          msg:  message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);*/
    }
  }



  Widget dBar(){
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
          ),
          child: user_id == null ?
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                  child: Row(
                      children: <Widget>[
                        Image.asset("./assets/image/user profile login.png",scale: 9,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ]
                  ),
                ),
              ),
              Divider(
                color: Colors.lightBlueAccent,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignupPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                  child: Row(
                      children: <Widget>[
                        Image.asset("./assets/image/user profile signup.png",scale: 9,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'SignUp',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ]
                  ),
                ),
              ),
              Divider(
                color: Colors.lightBlueAccent,
              )
            ],
          ):
          Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration( color:Color(0xFF81C1DF),),
                  currentAccountPicture: new Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                      images == null ?
                      DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage("https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                      ):
                      DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(images),
                      )
                    ),
                  ),
                  accountName: Text("$fName $lName",style: TextStyle(
                      color: Colors.black87
                  ),),
                  accountEmail: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$email',style: TextStyle(
                          color: Colors.black87
                      ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateUserProfile()),
                          );
                        },
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.edit)
                        ),
                      ),
                    ],
                  )

              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(

                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                              children: <Widget>[
                                Image.asset("./assets/images/settings about us.png",scale: 11,),

                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'ABOUT US',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/settings assets.png",scale: 7,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'DASHBOARD',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Assets_tab()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/settings assets.png",scale: 7,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'ASSETS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrderHistory()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/settings reports.png",scale: 9,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'REPORT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,),
                                  ),
                                ]
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      KYCFirst()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/settings kyc.png",scale: 7,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'KYC',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            var rsp = await response();
                            var message = rsp['message'];
                            var data = rsp['data'];
                            var record = data['record'];
                            var bank_status = record['bank_status'];
                            var error = rsp['error'];
                            if(bank_status != "Completed"){
                              Fluttertoast.showToast(
                                  msg:  "Bank details already in request",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 18.0);
                            }else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateNewBank()),
                              );
                            }

                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/settings bank payments.png",scale: 8,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'BANK DETAILS UPDATE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                              children: <Widget>[
                                Image.asset("./assets/images/settings privacy policy.png",scale: 11,),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'PRIVACY POLICY',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                              children: <Widget>[
                                Image.asset("./assets/images/settings faq.png",scale:11,),

                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'FAQ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/images/settings career.png",scale: 11,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'CAREER',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            /*Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: BasicDetail(),
                                      ),
                                    );*/
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/images/settings.png",scale: 9,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'SETTING',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                              children: <Widget>[
                                Image.asset("./assets/images/settings help n support.png",scale: 11,),

                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'HELP & SUPPORT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                              children: <Widget>[
                                Image.asset("./assets/images/settings tnc.png",scale: 11,),

                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'TERMS & CONDITION',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.blueGrey,
                                    title: Text("Confirm Logout"),
                                    content: Text(
                                        "Are you sure you want to logout?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("YES", style: TextStyle(
                                            color: Colors.white
                                        ),),
                                        onPressed: () {
                                          main();
                                        },
                                      ),
                                      TextButton(
                                        child: Text("NO", style: TextStyle(
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
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Row(
                                children: <Widget>[
                                  Image.asset("./assets/image/user profile logout.png",scale:11,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'LOGOUT',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Align(
                            alignment: Alignment.center,
                            child: Text('Fynzon 1.0.1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),)),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}