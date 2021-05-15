import 'package:flutter/material.dart';
import 'package:fyn_zon/Profile.dart';
import 'package:fyn_zon/horizontal_list.dart';
import 'package:fyn_zon/wallet.dart';
import 'package:fyn_zon/dBar.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import './MarketTab.dart';
import 'package:flutter/services.dart';
import './Info.dart';
import 'package:page_transition/page_transition.dart';
import './orderHistory.dart';

class MainScreenPage extends StatefulWidget {
  @override
  MainScreenState createState() => new MainScreenState();

}

class MainScreenState extends State<MainScreenPage> {
  int _selectedPage = 1;
  final _pageOptions = [
    InfoPage(),
    MarketsTabPage(),
    ProfilePage(),
    OrderHistory(),
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
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            title: new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 GestureDetector(
                   onTap:(){

                     Navigator.push(
                       context,
                       PageTransition(
                         type: PageTransitionType.leftToRight,
                         child: Dbar(),
                       ),
                     );
            },
                   child: Container(
                     child: Icon(Icons.supervised_user_circle_outlined,color: Colors.white,),
                   ),
                 ),
            ],

      ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Image.asset(
                  "./assets/fynzon_logo.png",
                  width: 110,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Icon(Icons.search,color: Colors.white,),
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: Wallet(),
                    ),
                  );
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Wallet(),
                    ),
                  );*/
                },
                child: Container(
                    padding: EdgeInsets.only(right: 20,top: 20),
                  child: Text(' \u{20B9}',style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24

                  ),)
                ),
              ),
            ],
          ),

          //  body: _pageOptions[_selectedPage],
          body: Container(

            color: Color(0xFF203040),
            child: Column(

              children: <Widget>[
                SizedBox(
                  height: 70,

                  child: FadeAnimation(2.5,HorizontalList()),

                  //
                ),
                Expanded(
                  child: _pageOptions[_selectedPage],
                )
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
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
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/fz_info.png"),
                  ),
                  title: Text(
                    "Info",
                    style: TextStyle(color: Colors.white),
                  )),
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
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
