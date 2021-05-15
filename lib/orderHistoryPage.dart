import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'package:fyn_zon/login.dart';
import 'mainApi.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';

class OrderHistoryModal {
  String message;
  String error;
  List<Data> data;

  OrderHistoryModal({this.message, this.error, this.data});

  OrderHistoryModal.fromJson(Map<String, dynamic> json) {
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
  String baseCurrency;
  String tradingCurrency;
  var price;
  var volume;
  String purpose;
  int time;

  Data(
      {this.sId,
      this.baseCurrency,
      this.tradingCurrency,
      this.price,
      this.volume,
      this.purpose,
      this.time});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    baseCurrency = json['baseCurrency'];
    tradingCurrency = json['tradingCurrency'];
    price = json['price'];
    volume = json['volume'];
    purpose = json['purpose'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['baseCurrency'] = this.baseCurrency;
    data['tradingCurrency'] = this.tradingCurrency;
    data['price'] = this.price;
    data['volume'] = this.volume;
    data['purpose'] = this.purpose;
    data['time'] = this.time;
    return data;
  }
}
class OrderHistoryMain extends StatefulWidget {
  @override
  _OrderHistoryMainState createState() => _OrderHistoryMainState();
}

class _OrderHistoryMainState extends State<OrderHistoryMain> {
  OrderHistoryModal futureAlbum;
  var total="";
  String inr="INR";
  //var total;
  @override
  void initState() {
    super.initState();
    if(AuthToken.marketdepthtade.isEmpty){
      fetchAlbum1();
    }else{
      fetchAlbum();
    }

  }


  fetchAlbum() async {

    var apiData = {
      "url": AuthToken.api +
          "/" +
          "orderHistory/tradeHistory/?tradingCurrency"+"="+AuthToken.marketdepthtade,
      //"data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      futureAlbum = OrderHistoryModal.fromJson(jsonDecode(onSuccess['response']));
      print("data>>>>>>>>>>" + futureAlbum.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }
  fetchAlbum1() async {

    var apiData = {
      "url": AuthToken.api +
          "/" +
          "orderHistory/tradeHistory/?tradingCurrency=BTC",
      //"data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      futureAlbum = OrderHistoryModal.fromJson(jsonDecode(onSuccess['response']));
      print("data>>>>>>>>>>" + futureAlbum.data.length.toString());
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),

      body: FadeAnimation(
        2.0,

         Container(child: FutureBuilder<OrderHistoryModal>(
          builder: (context, snapshot) {
            if (futureAlbum != null) {
              return FadeAnimation(
                0.0,
                 Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Pair",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          //Spacer(),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                "Amount",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                "Price",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                "Total",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: futureAlbum.data.length == null
                              ? 0
                              : futureAlbum.data.length,
                          itemBuilder: (context, position) {
                            var volume = futureAlbum.data[position].volume.toString();
                            var price = futureAlbum.data[position].price.toString();
                            var sum = double.parse(volume) * double.parse(price);

                            if(AuthToken.baseinr != inr){
                              total = sum.toString();
                            }else {
                              total = sum.toStringAsFixed(0);
                            }
                            print(sum.toString());
                            return Container(
                              height: 60,
                              margin: EdgeInsets.only(top: 2),
                              child: Card(
                                //color: Color(0xFF18222C),
                                color: getMyColor(position),
                                margin: EdgeInsets.symmetric(),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                //color: getMyColor(index),
                                //color: Color(0xFF18222C),
                                child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                              text: futureAlbum
                                                  .data[position].tradingCurrency,
                                              style: TextStyle(color: Colors.green,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: "/",
                                                  style: TextStyle(color: Colors.grey[500],
                                                      fontSize: 11),
                                                ),
                                                TextSpan(
                                                  text: futureAlbum
                                                      .data[position].baseCurrency,
                                                  style:  TextStyle(color: Colors.grey[500],
                                                      fontSize: 11),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Text(
                                          futureAlbum.data[position].price.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.green, fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Text(
                                          futureAlbum.data[position].volume.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.green, fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(right:10),
                                        child: Text(
                                          total,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          softWrap: true,
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
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.only(top: 80),
                child: CircularProgressIndicator(backgroundColor: Colors.white,));
          },
        )),
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





