
import 'package:flutter/material.dart';
import 'package:fyn_zon/KYC/bank_detail.dart';
import 'package:fyn_zon/KYC/basic_detail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/KYC/panCard.dart';
import 'package:fyn_zon/KYC/selfi.dart';
import '../custom_appbar.dart';
import 'adharCard.dart';
import 'common_api.dart';

class KYCFirst extends StatefulWidget {
  const KYCFirst({Key key}) : super(key: key);

  @override
  _KYCFirstState createState() => _KYCFirstState();
}

class _KYCFirstState extends State<KYCFirst> {


  @override
  void initState() {
    super.initState();
    status();
  }
  var gen_status;
  var pan_status;
  var aadhaar_status;
  var bank_status;
  var error;
  var kycApproved;
  var message;
  status()async{
    var rsp = await response();
    message = rsp['message'];
    var data = rsp['data'];
    var record = data['record'];
    kycApproved = record['kycApproved'];

    error = rsp['error'];
    if(error == "true"){
      print('error');
    }else{
      gen_status = record['gen_status'];
      pan_status = record['pan_status'];
      aadhaar_status = record['aadhaar_status'];
      bank_status = record['bank_status'];
      print(gen_status);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('KYC Verification'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            height: MediaQuery.of(context).size.height/1.3,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("./assets/image/fynzon mobile app ui kyc.png"),
          ),
        ],
      ),
        floatingActionButton: new FloatingActionButton(
            elevation: 3,
            child: new Icon(Icons.chevron_right_outlined,size: 30),
            backgroundColor: Colors.orange,
            onPressed: (){

      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Text("KYC Status"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Personal Info',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      Text(gen_status,style: TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PAN Card Info',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      Text(pan_status,style: TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Aadhaar Card Info',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      Text(aadhaar_status,style: TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bank Info',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      Text(bank_status,style: TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),),
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child:
                  Text("OK", style: TextStyle(
                      color: Colors.white
                  ),),
                    onPressed: ()async {

                     /* var rsp = await response();
                      var message = rsp['message'];
                      var data = rsp['data'];
                      var record = data['record'];
                      var kycApproved = record['kycApproved'];
                      var gen_status = record['gen_status'];
                      var pan_status = record['pan_status'];
                      var aadhaar_status = record['aadhaar_status'];
                      var bank_status = record['bank_status'];
                      var error = rsp['error'];*/
                      if(error == "true"){
                        Fluttertoast.showToast(
                            msg:  message,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }else if(kycApproved == true) {
                        Fluttertoast.showToast(
                            msg: "KYC Approved",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if(gen_status == "Requested" || gen_status == "Completed") {
                        /*Fluttertoast.showToast(
                            msg: "Personal info in pending for approval",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);*/
                        if(pan_status == "Requested" || pan_status == "Completed") {
                          /*Fluttertoast.showToast(
                              msg: "Pan card info in pending for approval",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);*/

                          if(aadhaar_status == "Requested" || aadhaar_status == "Completed") {
                           /* Fluttertoast.showToast(
                                msg: "Aadhaar info in pending for approval",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);*/
                            if(bank_status == "Requested" || bank_status == "Completed") {
                             /* Fluttertoast.showToast(
                                  msg: "Bank info in pending for approval",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);*/
                            }else{
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BankDetail()),
                              );
                            }

                          }else{
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdharCard()),
                            );
                          }

                        }else{
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PanCard()),
                          );
                        }
                      }else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BasicDetail()),
                        );
                      }

                    }
                )
              ],
            );
          }
      );





            },
            /*onPressed: ()async {
              var rsp = await response();
              var message = rsp['message'];
              var data = rsp['data'];
              var record = data['record'];
              var kycApproved = record['kycApproved'];
              var gen_status = record['gen_status'];
              var pan_status = record['pan_status'];
              var aadhaar_status = record['aadhaar_status'];
              var bank_status = record['bank_status'];
              var error = rsp['error'];
              if(error == "true"){
                Fluttertoast.showToast(
                    msg:  message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }else if(kycApproved == true) {
                Fluttertoast.showToast(
                    msg: "KYC Approved",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if(gen_status == "Requested" || gen_status == "Completed") {
                Fluttertoast.showToast(
                    msg: "Personal info in pending for approval",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
    if(pan_status == "Requested" || pan_status == "Completed") {
      Fluttertoast.showToast(
          msg: "Pan card info in pending for approval",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

    if(aadhaar_status == "Requested" || aadhaar_status == "Completed") {
      Fluttertoast.showToast(
          msg: "Aadhaar info in pending for approval",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    if(bank_status == "Requested" || bank_status == "Completed") {
      Fluttertoast.showToast(
          msg: "Bank info in pending for approval",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BankDetail()),
      );
    }

    }else{
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AdharCard()),
      );
    }

    }else{
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PanCard()),
      );
    }
              }else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BasicDetail()),
                );
              }

            }*/
        )
    );
  }
}



/* if(error == "true"){
                Fluttertoast.showToast(
                    msg:  message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }else if(kycApproved == true){
                Fluttertoast.showToast(
                    msg:  "KYC Approved",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              else if(gen_status == "Requested" || gen_status == "Completed"){
                Fluttertoast.showToast(
                    msg:  "personal info Successfully submitted",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                if(pan_status == "Pending" || pan_status == "Pending"){
                  Fluttertoast.showToast(
                      msg:  "pan card info Successfully submitted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  if(aadhaar_status == "Requested" || aadhaar_status == "Completed"){
                    Fluttertoast.showToast(
                        msg:  "Aadhaar info Successfully submitted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    if(bank_status == "Requested" || bank_status == "Completed"){
                      Fluttertoast.showToast(
                          msg:  "bank info Successfully submitted",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BankDetail()),
                    );
                  }
                }
                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PanCard()),
                  );
                }

              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BasicDetail()),
                );
              }

            }*/
