import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/login.dart';
import './services/order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import 'mainApi.dart';
class BuyModel {
  String message;
  String error;
  List<Data> data;

  BuyModel({this.message, this.error, this.data});

  BuyModel.fromJson(Map<String, dynamic> json) {
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
  var sId;
  var price;
  var volume;

  Data({this.sId, this.price, this.volume});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['volume'] = this.volume;
    return data;
  }
}

class SellModel {
  String message;
  String error;
  List<Data> data;

  SellModel({this.message, this.error, this.data});

  SellModel.fromJson(Map<String, dynamic> json) {
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

class Data2 {
  var sId;
  int price;
  double volume;

  Data2({this.sId, this.price, this.volume});

  Data2.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['volume'] = this.volume;
    return data;
  }
}

class MarketDepth extends StatefulWidget {
  @override
  _MarketDepthState createState() => _MarketDepthState();
}

class _MarketDepthState extends State<MarketDepth> {
  BuyModel fetchModal;
  SellModel fetchModal2;
  @override
  void initState() {
    super.initState();
    fetchBuy();
    fetchSell();
   /* if(AuthToken.marketdepthtade.isEmpty){
      fetchBuy1();
      fetchSell1();
    }else{
      fetchBuy();
      fetchSell();
    }*/

  }

  fetchBuy() async {
    // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};
    var apiData = {
      "url": AuthToken.api + "/" + "orders/marketDepth?purpose=buy&tradingCurrency=ETH",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal = BuyModel.fromJson(jsonDecode(onSuccess['response']));
      print("buycurrency>>>>>>> " + fetchModal.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
  fetchBuy1() async {
    // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};
    var apiData = {
      "url": AuthToken.api + "/" + "orders/marketDepth?purpose=buy&tradingCurrency=BTC",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal = BuyModel.fromJson(jsonDecode(onSuccess['response']));
      print("buycurrency>>>>>>> " + fetchModal.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
  fetchSell() async {
    // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};

    var apiData = {
      "url": AuthToken.api + "/" + "orders/marketDepth?purpose=sell&tradingCurrency=ETH",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal2 = SellModel.fromJson(jsonDecode(onSuccess['response']));
      print("sellcurrency>>>>>>> " + fetchModal2.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
  fetchSell1() async {
    // var data = {"baseCurrency": "INR", "tradingCurrency": "USDT"};

    var apiData = {
      "url": AuthToken.api + "/" + "orders/marketDepth?purpose=sell&tradingCurrency=BTC",
      // "data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      fetchModal2 = SellModel.fromJson(jsonDecode(onSuccess['response']));
      print("sellcurrency>>>>>>> " + fetchModal2.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
 var num;
 var num2;
  var value;
  var value1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body: FadeAnimation(
        2.0,

        Container(

          child: FutureBuilder<BuyModel>(
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot  snapshot){
              if(fetchModal != null && fetchModal2 != null){

                return FadeAnimation(
                  0.0
                  ,Column(
                    children: [
                      Container(
                        height: 50,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Volume", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text("Buy Price", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Volume", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text("Sell Price", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(child: Row(
                        children: <Widget>[

                          Expanded(
                            child: ListView.builder(
                                itemCount: fetchModal.data.length,
                                itemBuilder: (context, position) {
                                  var num = double.parse(fetchModal.data[position].volume.toString());
                                 String value = num.toString();
                                  int pointIndex = value.indexOf(".");
                                  String afterDecimal = value.substring(pointIndex+1);
                                  int finalLen = afterDecimal.length;
                                  String a = '0';
                                  String b = '00';
                                  String c = '000';
                                  if(finalLen == 1){
                                    value = '$value$c';
                                    print("answerc"+value);
                                  }else if(finalLen>1 && finalLen<3) {
                                    value= '$value$b';
                                    print("answerb"+value);
                                  }else if(finalLen>2 && finalLen<4){
                                    value= '$value$a';
                                    print("answera"+value);
                                  }else if(finalLen>4){
                                    value= num.toStringAsFixed(4);
                                    print("answeraaaaa"+value);
                                  }else {
                                    value = value.substring(0,pointIndex)+value.substring(pointIndex,pointIndex+5);
                                    print("answer "+value);
                                  }
                                  return Container(
                                    height: 40,
                                    child: Card(
                                      margin: EdgeInsets.symmetric(),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                      ),
                                      color: getMyColor(position),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            flex:5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text(
                                                value,
                                                style: TextStyle(color: Colors.green,fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(left: 16),
                                              child: Text(
                                                fetchModal.data[position].price.toString(),
                                                style: TextStyle(color: Colors.white,fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),

                          Expanded(
                            child: ListView.builder(
                                itemCount: fetchModal2.data.length,
                                itemBuilder: (context, position) {
                                  var num1 = double.parse(fetchModal2.data[position].volume.toString());
                                  String value = num1.toString();
                                  int pointIndex = value.indexOf(".");
                                  String afterDecimal = value.substring(pointIndex+1);
                                  int finalLen = afterDecimal.length;
                                  String a = '0';
                                  String b = '00';
                                  String c = '000';
                                  if(finalLen == 1){
                                    value1 = '$value$c';
                                    print("answerc"+value);
                                  }else if(finalLen>1 && finalLen<3) {
                                    value1= '$value$b';
                                    print("answerb"+value);
                                  }else if(finalLen>2 && finalLen<4){
                                    value1= '$value$a';
                                    print("answera"+value);
                                  }else if(finalLen>4){
                                    value1= num1.toStringAsFixed(4);
                                    print("answeraaaaa"+value);
                                    print("lalit>>>>>>>$num1");
                                  }else {
                                    value1 = value.substring(0,pointIndex)+value.substring(pointIndex,pointIndex+5);
                                    print("answer "+value);
                                  }
                                  return Container(
                                    height: 40,
                                    child: Card(
                                      margin: EdgeInsets.symmetric(),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                      ),
                                      color: getMyColor(position),
                                      child: Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            flex:5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text(
                                                value1,
                                                style: TextStyle(color: Colors.red,fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(left: 16),
                                              child: Text(
                                                fetchModal2.data[position].price.toString(),
                                                style: TextStyle(color: Colors.white,fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ))
                    ],
                  ),
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
          )
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

