import 'package:flutter/material.dart';
import 'package:fyn_zon/paymentOption.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/mainscreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';

class BankAccount extends StatefulWidget {
  /*String selectedSalutation, fname, lname, dob, address, state,
      city, pin, pan, adhaar;
  BankAccount({
    Key key,
    @required this.selectedSalutation,
    @required this.fname,
    @required this.lname,
    @required this.dob,
    @required this.address,
    @required this.state,
    @required this.city,
    @required this.pin,
    @required this.pan,
    @required this.adhaar,
  }) : super(key: key);*/


  @override
  State<StatefulWidget> createState() {
    return BankAccountState();
  }
}

class BankAccountState extends State<BankAccount> {

 // String selectedSalutation, fname, lname, dob, address, state, city, pin, pan, adhaar;


  final _formKey = GlobalKey<FormState>();
  TextEditingController accController = new TextEditingController();
  TextEditingController reaccController = new TextEditingController();
  TextEditingController ifscController = new TextEditingController();
  var bankAccNo ="";
  var reacc ="";
  var ifscCode ="";
  String accType;
  List<String> _accType = ['Savings','Current'];
  bool _isLoading=false;

  Future createAlbum(
      String bankAccNo,
      String ifscCode,
      String accType,
      BuildContext context) async {
    setState(() => _isLoading = true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      "bankAccNo": bankAccNo,
      "ifscCode": ifscCode,
      "accType": accType,
    };

    var apiData = {
      "url":
      AuthToken.api + "/" + "client/updateProfile/" + prefs.getString('token'),
      "data": data
    };

    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      var id = jsonDecode(onSuccess["response"])['data'].toString();
     // print("id");
      Fluttertoast.showToast(
          msg: "Bank Detail Uploaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("status: " + id);
      setState(() => _isLoading = false);
      Navigator.pop(context);
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: MainScreenPage(),
        ),
      );
    }, (onError) {
      setState(() => _isLoading = false);
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Error working with the api");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 5,right: 5,top: 10),
            child: Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20,),
                      child: Text('Add your bank account details for IMPS payments',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("ACCOUNT NUMBER",style: TextStyle(
                          fontSize: 12,
                        color: Colors.grey,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        //textCapitalization: TextCapitalization.sentences,
                        cursorHeight: 18,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            height: 0.5,
                            color: Colors.black
                        ),
                        controller: accController,
                        validator: (text) {
                          if (text.trim().length < 4)
                            return "Account Number Should not be blank.";
                          bankAccNo = accController.text;
                          return null;
                        },
                        onSaved: (text) => bankAccNo = text,

                        decoration: new InputDecoration(
                          /* border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red)
                              ),*/

                          enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          filled: true,
                          prefixText: ' ',
                          fillColor: Colors.white10,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("RE- ENTER ACCOUNT NUMBER",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        //textCapitalization: TextCapitalization.sentences,
                        cursorHeight: 18,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            height: 0.5,
                            color: Colors.black
                        ),
                        controller: reaccController,
                        validator: (text) {
                          if (text.trim().length < 4)
                            return "Re Enter Account Number Should not be blank.";
                          reacc = reaccController.text;
                          return null;
                        },
                        onSaved: (text) => reacc = text,

                        decoration: new InputDecoration(
                          /* border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red)
                              ),*/

                          enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          filled: true,
                          prefixText: ' ',
                          fillColor: Colors.white10,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("IFSC CODE",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        //textCapitalization: TextCapitalization.sentences,
                        cursorHeight: 18,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            height: 0.5,
                            color: Colors.black
                        ),
                        controller: ifscController,
                        validator: (text) {
                          if (text.trim().length < 2)
                            return "Ifsc Code Should not be blank.";
                          ifscCode = ifscController.text;
                          return null;
                        },
                        onSaved: (text) => ifscCode = text,

                        decoration: new InputDecoration(
                          /* border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.red)
                              ),*/

                          enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          filled: true,
                          prefixText: ' ',
                          fillColor: Colors.white10,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400])),
                      child: DropdownButtonHideUnderline(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.white,
                          ),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text(
                              'Select Account Type',
                              style: TextStyle(color: Colors.grey),
                            ), // Not necessary for Option 1
                            value: accType,
                            onChanged: (salutation) =>
                                setState(() => accType = salutation),
                            validator: (value) =>
                            value == null ? 'Select Account Type' : null,
                            items: _accType.map((value) {
                              return DropdownMenuItem(
                                child: new Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                     // width: MediaQuery.of(context).size.width,
                      child: _isLoading ?
                          CircularProgressIndicator():
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {

                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              createAlbum(bankAccNo, ifscCode,
                              accType,context,
                              );
                            } else {}
                          },
                          textColor: Colors.white,
                          color: Colors.green,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "SUBMIT",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
