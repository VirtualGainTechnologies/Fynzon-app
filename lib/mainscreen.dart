import 'package:flutter/material.dart';
import 'package:fyn_zon/Profile.dart';
import 'package:fyn_zon/deposit.dart';
import 'package:fyn_zon/horizontal_list.dart';
import 'package:fyn_zon/wallet.dart';
import 'package:fyn_zon/dBar.dart';
import 'package:fyn_zon/withdraw.dart';
import 'package:provider/provider.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import './MarketTab.dart';
import 'package:flutter/services.dart';
import './Info.dart';
import 'package:page_transition/page_transition.dart';
import './orderHistory.dart';
import 'Network/network_aware_widget.dart';
import 'Network/network_status_service.dart';
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
              onTap:(){

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
