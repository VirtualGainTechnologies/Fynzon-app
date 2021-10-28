import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:fyn_zon/mainscreen.dart';
import 'package:fyn_zon/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';

class UpdateProfile extends StatefulWidget {

  final String name, lastname,  state, nationality, email, city, pincode, pin, phone;
  UpdateProfile( this.name, this.lastname,  this.state, this.nationality,this.email, this.city,this.pincode, this.pin, this.phone, {Key key})
      : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController nationalityController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  var fname = "";
  var lname = "";
  var state = "";
  var nationality = "";
  var email = "";
  var city = "";
  var pincode = "";
  var pin = "";
  @override
  void initState() {
    super.initState();
    fnameController.text = widget.name;
    lnameController.text = widget.lastname;
    stateController.text = widget.state;
     nationalityController.text = widget.nationality;
     emailController.text = widget.email;
     cityController.text = widget.city;
    pincodeController.text = widget.pincode;
     pinController.text = widget.pin;

  }

  @override//withkha h

  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () {
          Navigator.pop(context);

        },
        child: Scaffold(
          backgroundColor: Color(0xFF18222C),
          appBar: AppBar(
            backgroundColor: Color(0xFF18222C),
            title: Text('Update Profile'),
          ),

          body: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          2.5,
                           Container(
                            margin: EdgeInsets.only(top: 27),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "./assets/images/fz_user.png",
                              scale: 4,
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            child: Text(
                              'Update Profile',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            // padding: EdgeInsets.only(left: 20,right: 20),
                            alignment: Alignment.topLeft,
                            // margin: EdgeInsets.only(top: 50),
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                  bottomRight: const Radius.circular(10.0),
                                  bottomLeft: const Radius.circular(10.0),
                                )),
                            child: Text(
                              widget.phone,
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            //border: Border.all(color: Colors.black,)
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("FIRST NAME *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: fnameController,

                              validator: (text) {
                                     if(text.trim().length<2)
                                       return "name Should not be blank.";
                                    // fname = fnameController.text;
                                     return null;
                                   },
                              onSaved: (text) => fname = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("LAST NAME *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: lnameController,
                               validator: (text) {
                                     if(text.trim().length<2)
                                       return "last name Should not be blank.";
                                     //name = fnameController.text;
                                     return null;
                                   },
                              onSaved: (text) => lname = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("STATE *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(

                              controller: stateController,
                              /* validator: (text) {
                                     if(text.trim().length<2)
                                       return "state Should not be blank.";
                                     //name = fnameController.text;
                                     return null;
                                   },*/
                              onSaved: (text) => state = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("COUNTRY *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(

                              controller: nationalityController,
                              /* validator: (text) {
                                     if(text.trim().length<2)
                                       return "nationality Should not be blank.";
                                    // name = fnameController.text;
                                     return null;
                                   },*/
                              onSaved: (text) => nationality = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("EMAIL *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,

                               validator: (text) {
                                     if (text.trim().isEmpty) return '';
                                     Pattern pattern =
                                         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                     RegExp regex = new RegExp(pattern);
                                     if (!regex.hasMatch(text))
                                       return 'Enter Valid Email'.toLowerCase();

                                     //email = emailController.text;
                                     return null;
                                   },
                              onSaved: (text) => email = text,
                              autocorrect: true,
                              autofocus: false,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("CITY *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: cityController,
                             /* validator: (text) {
                                     if(text.trim().length<2)
                                       return "city Should not be blank.";
                                     //name = fnameController.text;
                                     return null;
                                   },*/
                              onSaved: (text) => city = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("PIN CODE *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: pincodeController,
                              /* validator: (text) {
                                     if(text.trim().length<4)
                                       return "pincode Should not be blank.";
                                     //name = fnameController.text;
                                     return null;
                                   },*/
                              onSaved: (text) => pincode = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("PIN *",style: TextStyle(
                              fontSize: 10,
                            color: Colors.white
                          ),),
                        ),
                        FadeAnimation(
                          2.5,
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: pinController,
                              validator: (text) {
                                if (text.trim().length > 0 && text.trim().length < 4)
                                  return "Please Enter 4 digit";
                               // pin = pinController.text;
                                return null;
                              },
                              onSaved: (text) => pin = text,
                              autocorrect: true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              cursorHeight: 18,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  height: 0.5,
                                  color: Colors.black
                              ),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                ),
                                filled: true,
                                prefixText: ' ',

                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2.5,
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                // fname = fnameController.text.toString();
                                lname = lnameController.text.toString();


                                _formKey.currentState.save();
                                setState(()=> _isLoading = true);
                                createAlbum(fname, lname, state,
                                    nationality, email, city, pincode, pin, context);
                              }
                            },
                            child:_isLoading
                              ?CircularProgressIndicator(
                                strokeWidth: 6.0,
                                backgroundColor: Colors.green,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                            )
                            :
                            Container(
                              padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                              margin: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                'UPDATE PROFILE ',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Colors.blue,
                                  ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

    ),
      );
  }
  createAlbum (
  String fname,
      String lname,
  String state,
      String nationality,
  String email,
      String city,
  String pincode,
      String pin,
  BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 /* var token = prefs.getString("token");
  AuthToken.authtoken = token;*/
  var data = {
    'fname': fname,
    'lname': lname,
    'state': state,
    'nationality': nationality,
    'email': email,
    'city': city,
    'pinCode': pincode,
    'pin': pin,
  };

  var apiData = {
    "url":
    AuthToken.api + "/" + "client/updateProfile/" + prefs.getString('token'),
    "data": data
  };

  ApiClass.postApiCall(apiData, (onSuccess) {
  print(onSuccess.toString());
  var id = jsonDecode(onSuccess["response"])['data'].toString();
  print("id");
  Fluttertoast.showToast(
  msg: "Successfully Updated Profile",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.green,
  textColor: Colors.white,
  fontSize: 16.0);
  print("status: " + id);
  setState(()=> _isLoading = false);
  Navigator.pop(context);
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => MainScreenPage(),
  ),
  );
  }, (onError) {
    setState(()=> _isLoading = false);
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
}
