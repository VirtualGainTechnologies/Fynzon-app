import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import 'BuySell.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'eth_Detail_Page.dart';
import 'login.dart';
import 'dart:convert';
import 'mainApi.dart';
class USDTModel {
  String message;
  String error;
  List<Data> data;

  USDTModel({this.message, this.error, this.data});

  USDTModel.fromJson(Map<String, dynamic> json) {
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

class MarketsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MarketsPageState();
  }
}

class MarketsPageState extends State<MarketsPage> {
  USDTModel fetchModal;
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
    var apiData = {"url": AuthToken.api + "/" + "v2/market/?baseCurrency=USDT",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal = USDTModel.fromJson(jsonDecode(onSuccess['response']));
      print("basecurrency>>>>>>> " + fetchModal.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
        ),
        child: FutureBuilder<USDTModel>(
          builder: (BuildContext context, AsyncSnapshot  snapshot) {
            if (fetchModal != null) {
              return  Column(
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "MARKET/VOL",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),

                        ),
                        Text(
                          "PRICE",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),

                        ),
                        Text(
                          "CHANGE",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),

                        ),
                      ],
                    ),
                  ),
                  Flexible(

                    child: ListView.builder(

                        itemCount: fetchModal.data.length,
                        itemBuilder: (context, position){
                         // AuthToken.marketdepthtade=fetchModal.data[position].sId;
                          return GestureDetector(
                            onTap: ()async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var userid = prefs.getString("userid");
                              if (userid == null) {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EthDetailPage(
                                              base: fetchModal.data[position].base,
                                              tread: fetchModal.data[position].sId,
                                              price: fetchModal.data[position].price.toString()
                                          )),
                                );

                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 2),
                              child:FadeAnimation(
                                0, Card(
                                  color: getMyColor(position),
                                  margin: EdgeInsets.symmetric(),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  // color: getMyColor(index),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(

                                          children: [
                                            ImageIcon(
                                              AssetImage("assets/bitcoin_1.png"),
                                              color: Color(0xFFFFFFFF),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
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
                                                        TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Text(
                                                        fetchModal.data[position].base,
                                                        style:
                                                        TextStyle(color: Colors.grey[500],
                                                            fontSize: 11),
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
                                          ],
                                        ),
                                      ),

                                      Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Text(
                                            ('₹ ${fetchModal.data[position].price.toString()}'),
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
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
                child: CircularProgressIndicator(strokeWidth: 6.0,
                    backgroundColor: Colors.green,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
          },
        ),




      ),
    );
  }
}

Color getMyColor(int position) {
  if (position % 2 == 0) {
    return Color(0xFF18222C);
  } else {
    return Color(0xFF233446);
  }
}
