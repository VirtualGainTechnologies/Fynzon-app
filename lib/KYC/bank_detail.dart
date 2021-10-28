
import 'package:flutter/material.dart';
import 'package:fyn_zon/mainscreen.dart';

import '../custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'common_api.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({Key key}) : super(key: key);

  @override
  _BankDetailState createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accController = new TextEditingController();
  TextEditingController bankNameController = new TextEditingController();
  TextEditingController reaccController = new TextEditingController();
  TextEditingController ifscController = new TextEditingController();
  var bankAccNo ="";
  var reacc ="";
  var bankName ="";
  var ifscCode ="";
  String accType;
  List<String> _accType = ['Savings','Current'];
  /*String bankName;
  List<String> _bankName = [
    "Punjab National Bank",
    'State Bank Of India',
    'Central Bank Of India',
    'ICICI Bank', 'HDFC Bank', ''];*/
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Bank Info'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                    child: Column(
                      children: <Widget>[

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('BANK ACCOUNT DETAILS',
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 0.5,
                                //fontFamily: 'berlinsans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        heading('NAME OF BANK'),
                        /*Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.lightBlueAccent.shade100,width: 0.5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: new EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0),
                              ),
                              isExpanded: true,
                              hint: Text(
                                'SELECT',
                                style: TextStyle(color: Colors.grey),
                              ), // Not necessary for Option 1
                              value: bankName,
                              onChanged: (salutation) =>
                                  setState(() => bankName = salutation),
                              validator: (value) =>
                              value == null ? 'SELECT' : null,
                              items: _bankName.map((value) {
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
                        ),*/
                       /* SizedBox(
                          height: 5,
                        ),*/

                        //heading('ACCOUNT HOLDER NAME'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autocorrect: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            //textCapitalization: TextCapitalization.sentences,
                            cursorHeight: 18,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                height: 0.5,
                                color: Colors.black
                            ),
                            controller: bankNameController,
                            validator: (text) {
                              if (text.isEmpty)
                                return "Please Enter the bank name";
                              bankName = bankNameController.text;
                              return null;
                            },
                            onSaved: (text) => bankName = text,

                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade400, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 0.5),
                              ),
                              filled: true,
                              prefixText: ' ',

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        heading('ACCOUNT NUMBER'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autocorrect: true,
                            autofocus: false,
                            keyboardType: TextInputType.number,
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
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade400, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 0.5),
                              ),
                              filled: true,
                              prefixText: ' ',

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        heading('CONFIRM ACCOUNT NUMBER'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autocorrect: true,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            //textCapitalization: TextCapitalization.sentences,
                            cursorHeight: 18,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                height: 0.5,
                                color: Colors.black
                            ),
                            controller: reaccController,
                            validator: (text) {
                              if (text != accController.text)
                                return "account not match";
                              reacc = reaccController.text;
                              return null;
                            },
                            onSaved: (text) => reacc = text,

                            decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade400, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 0.5),
                              ),
                              filled: true,
                              prefixText: ' ',

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        heading('IFSC'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autocorrect: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
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
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade400, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 0.5),
                              ),
                              filled: true,
                              prefixText: ' ',

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        heading('ACCOUNT TYPE'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.lightBlueAccent.shade100,width: 0.5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: new EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0),
                                  ),
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

                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  // width: MediaQuery.of(context).size.width,
                  child: _isLoading ?
                  CircularProgressIndicator(
                      strokeWidth: 6.0,
                      backgroundColor: Colors.green,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                  ):
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var rsp = await bank(bankName, bankAccNo, ifscCode, accType);
                          var message = rsp['message'];
                          var error = rsp['error'];
                          if(error == "true"){
                            print("failed $error");
                            Fluttertoast.showToast(
                                msg:  "Something went wrong",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                            print("succ $error");
                            Fluttertoast.showToast(
                                msg:  message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreenPage()),
                            );
                          }
                        }
                      },
                      textColor: Colors.white,
                      color:Color(0xFF144A7D),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "PROCEED",
                        style: TextStyle(

                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            //fontFamily: 'berlinsans',
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget heading(String text){
    return Align(
      alignment: Alignment.topLeft,
      child: Text(text,style: TextStyle(
          fontSize: 12,
          color: Colors.black,fontWeight: FontWeight.w600
      ),),
    );
  }
}
