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
    fetchAlbum();
   /* if(AuthToken.marketdepthtade.isEmpty){
      fetchAlbum1();
    }else{
      fetchAlbum();
    }*/
  }


  fetchAlbum() async {

    var apiData = {
      "url": AuthToken.api +
          "/" +
          "orderHistory/tradeHistory/?tradingCurrency=ETH",
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
  /*fetchAlbum1() async {

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
  }*/
  var num;
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body: FadeAnimation(
        0,
         Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: new BoxDecoration(
               image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
             ),
             child: FutureBuilder<OrderHistoryModal>(
          builder: (context, snapshot) {
            if (futureAlbum != null) {
              return FadeAnimation(
                0.0,
                 Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "PAIR",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          //Spacer(),
                          Text(
                            "PRICE",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),
                          ),
                          Text(
                            "VOLUME",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),
                          ),
                          Text(
                            "TOTAL",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),
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
                            var num1 = double.parse(futureAlbum.data[position].volume.toString());
                            String value = num1.toString();
                            int pointIndex = value.indexOf(".");
                            String afterDecimal = value.substring(pointIndex+1);
                            int finalLen = afterDecimal.length;
                            String a = '0';
                            String b = '00';
                            String c = '000';
                            if(finalLen == 1){
                              value = '$value$c';
                              print("answerc"+value);
                            }else if(finalLen == 2) {
                              value= '$value$b';
                              print("answerb"+value);
                            }else if(finalLen == 3){
                              value= '$value$a';
                              print("answera"+value);
                            }else if(finalLen == 4){
                              value= value;
                              print("answeraaaaa"+value);
                            }else if(finalLen > 4){
                              value= num1.toStringAsFixed(4);
                            }else {
                              value = value.substring(0,pointIndex)+value.substring(pointIndex,pointIndex+5);
                              print("answer "+value);
                            }
                            /*if(AuthToken.baseinr != inr){
                              total = sum.toString();
                            }else {
                              total = sum.toStringAsFixed(0);
                            }*/
                            print(sum.toString());
                            return Container(
                              height: 40,
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
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                              text:

                                              futureAlbum
                                                  .data[position].tradingCurrency,
                                              style: TextStyle(color:

                                              Colors.white,
                                                  fontSize: 12,
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
                                      flex: 3,
                                      child: Text(
                                        futureAlbum.data[position].price.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(

                                            color: futureAlbum
                                            .data[position].purpose == "buy"?
                                        Colors.green
                                            :
                                        Colors.red,
                                             fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        softWrap: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                            Colors.white, fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(right:10),
                                        child: Text(
                                          sum.toStringAsFixed(0).toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                              Colors.white, fontSize: 15,
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
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
                ),
                child: CircularProgressIndicator(  strokeWidth: 6.0,
                    backgroundColor: Colors.green,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
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





