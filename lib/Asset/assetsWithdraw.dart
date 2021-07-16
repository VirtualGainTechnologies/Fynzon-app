
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fyn_zon/mainApi.dart';

import '../tokenPass.dart';
class Autogenerated {
  String message;
  String error;
  List<Data> data;

  Autogenerated({this.message, this.error, this.data});

  Autogenerated.fromJson(Map<String, dynamic> json) {
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
  String requestedDate;
  String adminStatus;
  String sId;
  String requestedCurrency;
  double requestedAmount;
  UserId userId;
  int transactionFees;
  int iV;

  Data(
      {this.requestedDate,
        this.adminStatus,
        this.sId,
        this.requestedCurrency,
        this.requestedAmount,
        this.userId,
        this.transactionFees,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    requestedDate = json['requestedDate'];
    adminStatus = json['adminStatus'];
    sId = json['_id'];
    requestedCurrency = json['requestedCurrency'];
    requestedAmount = json['requestedAmount'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    transactionFees = json['transactionFees'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestedDate'] = this.requestedDate;
    data['adminStatus'] = this.adminStatus;
    data['_id'] = this.sId;
    data['requestedCurrency'] = this.requestedCurrency;
    data['requestedAmount'] = this.requestedAmount;
    if (this.userId != null) {
      data['userId'] = this.userId.toJson();
    }
    data['transactionFees'] = this.transactionFees;
    data['__v'] = this.iV;
    return data;
  }
}

class UserId {
  String sId;
  int phone;
  String fname;
  String lname;
  String email;

  UserId({this.sId, this.phone, this.fname, this.lname, this.email});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    return data;
  }
}
class AssetsWithdraw extends StatefulWidget {
  const AssetsWithdraw({Key key}) : super(key: key);

  @override
  _AssetsWithdrawState createState() => _AssetsWithdrawState();
}

class _AssetsWithdrawState extends State<AssetsWithdraw> {

  Autogenerated futureAlbum;
  @override
  void initState() {
    super.initState();
    fetchAlbum1();
    setState(() {

    });
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
      "url": AuthToken.api + "/" + "wallet/withdrawRequest/"+ prefs.getString('token'),
      //"data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      futureAlbum = Autogenerated.fromJson(jsonDecode(onSuccess['response']));
      //print("walletqrcode>>>>>>> " + futureAlbum.data.phone.toString());
      print("walletqrcode>>>>>>> " + futureAlbum.message.toString());

      setState(() {});
    }, (onError) {
      print("Error working with the api");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body:
      Container(
        child: FutureBuilder<Autogenerated>(
            builder: (context, snapshot){
              if (futureAlbum != null){
                return

                  ListView.builder(
                    itemCount: futureAlbum.data.length == null
                        ? 0
                        : futureAlbum.data.length,
                    itemBuilder: (context, position){
                      return Container(
                        height: 90,
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Text(futureAlbum.data[position].requestedCurrency.toString(),style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                            title: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('${futureAlbum.data[position].userId.fname.toString() } ${futureAlbum.data[position].userId.lname.toString()}',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.w600
                                ),)),
                            subtitle: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(futureAlbum.data[position].userId.phone.toString(),style: TextStyle(

                                        fontSize: 16,
                                        //fontWeight: FontWeight.w600
                                      ),)),
                                  SizedBox(height: 5,),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(futureAlbum.data[position].userId.email.toString()))
                                ]),
                            trailing: Text(futureAlbum.data[position].requestedAmount.toString(),style: TextStyle(

                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      );
                    }
                  );
              }else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(top: 80),
                  child: CircularProgressIndicator(backgroundColor: Color(0xFF18222C),));
            }
        ),
      ),
    );
  }
}