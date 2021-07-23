import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import 'BuySell.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mainApi.dart';

class INRModel {
  String message;
  String error;
  List<Data> data;

  INRModel({this.message, this.error, this.data});

  INRModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String sId;
  String base;
  int time;
  int price;

  Data({this.sId, this.base, this.time, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    base = json['base'];
    time = json['time'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['base'] = this.base;
    data['time'] = this.time;
    data['price'] = this.price;
    return data;
  }
}

class MarketINR extends StatefulWidget {
  @override
  _MarketINRState createState() => _MarketINRState();
}

class _MarketINRState extends State<MarketINR> {
  INRModel fetchModal;
  bool positiveNegative = true;
  Timer timer;
  String text;
  String base, tread;
  var price;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    fetchInr();
  }


  fetchInr() async {
   // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};
    var apiData = {"url": AuthToken.api + "/" + "v2/market/?baseCurrency=INR",
     // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal = INRModel.fromJson(jsonDecode(onSuccess['response']));
       print("basecurrency>>>>>>> " + fetchModal.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
 /* Future loginUser(String phone, String password) async
  {
    String url = AuthToken.api + "/" + "v2/market/?baseCurrency=INR";
    final response= await http.post(url,
        headers: {"Accept": "Application/json"},
        body: {
          "phone": phone,
          "pin": password

        }
    );

    var convertedDatatoJson =jsonDecode(response.body);
    return convertedDatatoJson;

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body: Container(
        child: FutureBuilder<INRModel>(
          builder: (BuildContext context, AsyncSnapshot  snapshot) {
            if (fetchModal != null) {
              return  Column(
                children: [
                  FadeAnimation(
                    2.5,
                     Container(
                      height: 30,
                      color: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              "Market/vol",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              "Price",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              "Change",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(

                    child: ListView.builder(
                        itemCount: fetchModal.data.length,
                        itemBuilder: (context, position){

                            //AuthToken.marketdepthtade=fetchModal.data[position].sId;

                          return GestureDetector(
                            onTap: ()async{
                              //AuthToken.marketdepthtade=fetchModal.data[position].sId;
                             // AuthToken.baseinr=fetchModal.data[position].base;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var userid = prefs.getString("userid");
                           /*   AuthToken.userid = user;
                              final token = prefs.getString("token");
                              AuthToken.authtoken = token;
                              print(user);*/
                              if (userid == null) {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              } else {
                               // welcomeModel(context);
                                showModalBottomSheet(
                                 // backgroundColor: Color(0xFF18222C),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Wrap(children: [BuySell( base: fetchModal.data[position].base,
                                    tread: fetchModal.data[position].sId,
                                    price: fetchModal.data[position].price.toString(),)]),
                                );
                               /* Navigator.push(context, MaterialPageRoute(builder: (context) => BuySell(
                                  base: fetchModal.data[position].base,
                                  tread: fetchModal.data[position].sId,
                                  price: fetchModal.data[position].price.toString(),
                                ))
                                );*/
                              }
                               /* Navigator.push(context, MaterialPageRoute(builder: (context) => BuySell(
                                  base: fetchModal.data[position].base,
                                  tread: fetchModal.data[position].sId,
                                  price: fetchModal.data[position].price.toString(),
                                )));*/
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 2),

                              child: FadeAnimation(
                                  2.5,
                                   Card(
                                  color: getMyColor(position),
                                  margin: EdgeInsets.symmetric(),
                                  elevation: 0,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  // color: getMyColor(index),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: <Widget>[
                                           // ImageIcon(AssetImage("./assets/images/fz_eth.png"),
                                              Image.asset("./assets/images/fz_eth.png",scale: 20,),
                                             // color: Color(0xFFFFFFFF),
                                            //),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10.0, bottom: 0.0),
                                                  child: Text(
                                                    fetchModal.data[position].sId,
                                                    style:
                                                    TextStyle(color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    '/',
                                                    style:
                                                    TextStyle(color: Colors.grey[500]),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    fetchModal.data[position].base,
                                                    style:
                                                    TextStyle(color: Colors.grey[500],
                                                      fontSize: 11
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, bottom: 6.0),
                                              child: Text(
                                                fetchModal.data[position].sId,
                                                style: TextStyle(color: Colors.grey[500],
                                                    fontSize: 11),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              child: Text(
                                                '₹ ',
                                                style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(right: 40),
                                              child: Text(
                                                fetchModal.data[position].price.toString(),
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0, left: 10.0),
                                        child: ColoredBox(
                                          color: positiveNegative == false
                                              ? Colors.red
                                              : Colors.green,
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                                child: Icon(
                                                  positiveNegative == false
                                                      ? Icons.arrow_downward
                                                      : Icons.arrow_upward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              /* Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Text(
                                                      _inrusdt.data.change.toString(),
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  )*/
                                            ],
                                          ),),)],),),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.only(top: 80),
                child: CircularProgressIndicator(backgroundColor: Colors.white,));
          },
        ),




    ),
    );
                    }
 /* static welcomeModel(BuildContext context) {
    showModalBottomSheet(

      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(children: [BuySell( base: fetchModal.data[position].base,
        tread: fetchModal.data[position].sId,
        price: fetchModal.data[position].price.toString(),)]),
    );
  }*/
}

Color getMyColor(int position) {
  if (position % 2 == 0) {
    return Color(0xFF18222C);
  } else {
    return Color(0xFF233446);
    //return Color(0xFF18222C);
  }
}
