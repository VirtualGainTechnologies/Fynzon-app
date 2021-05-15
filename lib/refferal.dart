import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refferal extends StatefulWidget {
  @override
  _RefferalState createState() => _RefferalState();
}

class _RefferalState extends State<Refferal> {
  final _formKey = GlobalKey<FormState>();
  var usdtController = new TextEditingController();
  var usdt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF18222C),
        title: Image.asset(
          "./assets/fynzon_logo.png",
          scale: 27.0,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 2),
                color: Color(0xFF357ABD),
                //alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 700,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        'FynZon Refferal Program',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'refer and earn 50% commission of every trade.Be your own Boss!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "./assets/images/fz_fifty.png",
                              scale: 1.7,
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              "./assets/images/fz_twofor.png",
                              scale: 1.7,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'earn 50% commission of every trade!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                'payout within 24 hours!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "./assets/images/fz_be.png",
                              scale: 1.7,
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              "./assets/images/fz_star.png",
                              scale: 1.7,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Unlimited earning!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                'Easy tracking & reports',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'How it works?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      /*  Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 300,
                          //width: MediaQuery.of(context).size.width,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(

                                    height:300,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                              OutlineButton(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: BorderSide(color: Colors.blue)
                              ),
                              onPressed: () {
                              print('Received click');
                              },
                              child: Text('Sign Up', style: TextStyle(
                              color: Colors.blue
                              )),
                              ),
                                          Container(
                                            margin:EdgeInsets.only(top: 30),
                                            child: Text('Get your link',
                                              textAlign:TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                          ),
                                          Text('Join FynZon and get your uniqe tracking link. you earn for customer who sign up through this link.',
                                                 textAlign:TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              height: 1.5
                                            ),)
                                       ],
                                      ),
                                    ),
                                  ),
                                ],

                              );
                            },
                            itemCount: 3,
                            viewportFraction: 0.8,
                            scale: 0.9,
                            pagination: SwiperPagination(alignment: Alignment.bottomCenter,
                              builder: new DotSwiperPaginationBuilder(
                                  color: Colors.grey, activeColor: Color(0xff38547C)),),
                           // control: SwiperControl(),
                          )
                      ),*/
                      Container(
                        //margin: EdgeInsets.only(top: 30),
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 300.0,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    OutlineButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          side: BorderSide(color: Colors.blue)),
                                      onPressed: () {
                                        print('Received click');
                                      },
                                      child: Text('Sign Up',
                                          style: TextStyle(color: Colors.blue)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: Text(
                                        'Get your link',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'Join FynZon and get your uniqe tracking link. you earn for customer who sign up through this link.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16, height: 1.5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: OutlineButton(
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                side: BorderSide(
                                                    color: Colors.blue)),
                                            onPressed: () {
                                              print('Received click');
                                            },
                                            child: Text(
                                                'https://www.javatpoint.com/',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                        Container(
                                          child: RaisedButton(
                                            child: Text("Share"),
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            splashColor: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: Text(
                                        'Share your link',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'Share your link vie Telegram, Twitter, Emails or anyway you want. The more you promote the more you earn.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16, height: 1.5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: OutlineButton(
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                side: BorderSide(
                                                    color: Colors.blue)),
                                            onPressed: () {
                                              print('Received click');
                                            },
                                            child: Text('Rewards',
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                        Container(
                                          child: OutlineButton(
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                side: BorderSide(
                                                    color: Colors.blue)),
                                            onPressed: () {
                                              print('Received click');
                                            },
                                            child: Text('~ ~ ~',
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: Text(
                                        'Earn when they tread!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'You earn 50% commission on every friends treading fees! Even while you asleep!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16, height: 1.5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 120),
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: null,
                          child: Text('LOGIN TO PARTICIPATE',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 70),
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text(
                        'How much can I earn in this trade commission program?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'As much as you want. The earnings are truly unlimited! You get 50% of the fees we charge each trade of your friends. The more your referred friends trade, the more you earn. So help your friend make more trades everyday and you will earn more commissions everyday!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text(
                        'When will the commission be creadited to my account?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'As much as you want. The earnings are truly unlimited! You get 50% of the fees we charge each trade of your friends. The more your referred friends trade, the more you earn. So help your friend make more trades everyday and you will earn more commissions everyday!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text(
                        'Do you have any tips that will help me earn more rewards?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'As much as you want. The earnings are truly unlimited! You get 50% of the fees we charge each trade of your friends. The more your referred friends trade, the more you earn. So help your friend make more trades everyday and you will earn more commissions everyday!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text(
                        'I referred a friend but I am not receving commission on his/her treads!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'As much as you want. The earnings are truly unlimited! You get 50% of the fees we charge each trade of your friends. The more your referred friends trade, the more you earn. So help your friend make more trades everyday and you will earn more commissions everyday!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text(
                        'Important rules to keep in mind',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'As much as you want. The earnings are truly unlimited! You get 50% of the fees we charge each trade of your friends. The more your referred friends trade, the more you earn. So help your friend make more trades everyday and you will earn more commissions everyday!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Divider(
                  thickness: 3,
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Image.asset(
                  "./assets/fynzon_logo.png",
                  scale: 16.0,
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: FlatButton(
                  onPressed: () {
                    print('hello');
                  },
                  child: Image.asset(
                    "./assets/images/fz_google.png",
                    scale: 2.2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: FlatButton(
                  onPressed: () {
                    print('hello');
                  },
                  child: Image.asset(
                    "./assets/images/fz_app.png",
                    scale: 2.2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: FlatButton(
                  onPressed: () {
                    print('hello');
                  },
                  child: Image.asset(
                    "./assets/images/fz_window.png",
                    scale: 2.2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: FlatButton(
                  onPressed: () {
                    print('hello');
                  },
                  child: Image.asset(
                    "./assets/images/fz_mac.png",
                    scale: 2.2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      'Support',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('FynZon Token')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('FynZon API')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Referral Program')),
                          Padding(
                              padding: EdgeInsets.all(7), child: Text('Blog')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Careers')),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 45, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Help Center')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Corporate Account')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('List your Token')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                'Partnerships & Enquiries',
                                textAlign: TextAlign.start,
                              )),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Media Assets')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                'Trading, Deposit',
                                textAlign: TextAlign.start,
                              )),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Security')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Buy Crypto',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      'Socials',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Buy Bitcoin')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Buy Ethereum')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Buy Tron')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Buy Ripple')),
                          Padding(
                              padding: EdgeInsets.all(7),
                              child: Text('Buy Litecoin')),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 45, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_tele.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Telegram')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_twi.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Twitter')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_face.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Facebook')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_you.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Youtube')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_link.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Linkedin')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_insta.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('Instagram')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "./assets/images/fz_coin.png",
                                scale: 35.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text('CoinMarketCap')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40, left: 40),
                child: Text(
                  'Legal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(7),
                        child: Text('Terms of use')),
                    Padding(
                        padding: EdgeInsets.all(7),
                        child: Text('Privacy Policy')),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: Text('2020 FynZon. All right reserved'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
