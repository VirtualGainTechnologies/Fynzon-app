import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyn_zon/paymentOption.dart';
import 'package:fyn_zon/postkycdata.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyn_zon/mainApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';

import 'mainscreen.dart';

class KYC extends StatefulWidget {
  @override
  _KYCState createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  String selectedSalutation;
  String _selecteddocumnt;
  bool _isLoading = false;
  List<String> _country = ['India'];
  List<String> _document = ['ADHAAR'];

  final _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  TextEditingController panController = new TextEditingController();
  TextEditingController adhaarController = new TextEditingController();
  var fname = "";
  var lname = "";
  var dob = "";
  var address = "";
  var state = "";
  var city = "";
  var pin = "";
  var pan = "";
  var adhaar = "";
  File panimageFile;
  File adhaarimageFile;
  File adhaarbackimageFile;

  Future createAlbum(
      String selectedSalutation,
      String fname,
      String lname,
      String dob,
      String address,
      String state,
      String city,
      String pin,
      String pan,
      String adhaar,
      BuildContext context) async {
    setState(() => _isLoading = true);
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    AuthToken.authtoken = token;
    var data = {
      "fname": fname,
      "lname": lname,
      "city": city,
      "state": state,
      "pinCode": pin,
      "country": selectedSalutation,
      "dob": dob,
      "address": address,
      "panNumber": pan,
      "adhaarNumber": adhaar
    };

    var apiData = {
      "url":
      AuthToken.api + "/" + "client/updateProfile/" + AuthToken.authtoken,
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
      setState(() => _isLoading = false);
      //Navigator.pop(context);
      fnameController.clear();
      lnameController.clear();
      dobController.clear();
      addressController.clear();
      stateController.clear();
      cityController.clear();
      pinController.clear();
      panController.clear();
      adhaarController.clear();
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


  Future<void> _panCard(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openpanGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openpanCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openpanGallery(BuildContext context) async {
    var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
    this.setState(() {
      panimageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future _openpanCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      panimageFile = image;
    });
    Navigator.of(context).pop();
  }

  Future<void> _adhaarCard(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openadhaarGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openadhaarCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openadhaarGallery(BuildContext context) async {
    var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
    this.setState(() {
      adhaarimageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future _openadhaarCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      adhaarimageFile = image;
    });
    Navigator.of(context).pop();
  }

  Future<void> _adhaarbackCard(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openadhaarbackGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openadhaarbackCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openadhaarbackGallery(BuildContext context) async {
    var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
    this.setState(() {
      adhaarbackimageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future _openadhaarbackCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      adhaarbackimageFile = image;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
       // backgroundColor: Color(0xFF18222C),
          backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF18222C),
          title: Text('KYC'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'SELECT YOUR COUNTRY',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
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
                            'Select Country',
                            style: TextStyle(color: Colors.grey),
                          ), // Not necessary for Option 1
                          value: selectedSalutation,
                          onChanged: (salutation) =>
                              setState(() => selectedSalutation = salutation),
                          validator: (value) =>
                              value == null ? 'Select Your Country' : null,
                          items: _country.map((value) {
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
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Personal Info',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(

                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("FIRST NAME *",style: TextStyle(
                      fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
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
                      controller: fnameController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "name Should not be blank.";
                        fname = fnameController.text;
                        return null;
                      },
                      onSaved: (text) => fname = text,

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
                    child: Text("LAST NAME *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                      controller: lnameController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "last name Should not be blank.";
                        lname = lnameController.text;
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
                    child: Text("D.O.B *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                      controller: dobController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "D.O.B Should not be blank.";
                        dob = dobController.text;
                        return null;
                      },
                      onSaved: (text) => dob = text,
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
                    child: Text("ADDRESS *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                      maxLines: 5,

                      controller: addressController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "address Should not be blank.";
                        address = addressController.text;
                        return null;
                      },
                      onSaved: (text) => address = text,
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
                    child: Text("STATE *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(

                      controller: stateController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "state Should not be blank.";
                        state = stateController.text;
                        return null;
                      },
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
                    child: Text("CITY *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(

                      controller: cityController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "city Should not be blank.";
                        city = cityController.text;
                        return null;
                      },
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
                    child: Text("PIN CODE *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                      controller: pinController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "pin Should not be blank.";
                        pin = pinController.text;
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
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Pan Card',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: Text("PAN CARD *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                      controller: panController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "Pan Should not be blank.";
                        pan = panController.text;
                        return null;
                      },
                      onSaved: (text) => pan = text,
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
                  if (panimageFile != null)
                    AspectRatio(
                      aspectRatio: 487 / 400,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.file(
                          panimageFile,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 25, bottom: 0.0),
                    child: new RaisedButton(
                        color: Color(0xfff2f3f5),
                        child: new Text('Upload Pan Card',
                            style: TextStyle(
                                color: Color(0xff114441),
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                            textAlign: TextAlign.left),
                        onPressed: () => {
                              _panCard(context),
                            }),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Document Type',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
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
                            'Selcet Document Type',
                            style: TextStyle(color: Colors.grey),
                          ), // Not necessary for Option 1
                          value: _selecteddocumnt,
                          onChanged: (salutation) =>
                              setState(() => _selecteddocumnt = salutation),
                          validator: (value) =>
                              value == null ? 'Select Your Document' : null,
                          items: _document.map((document) {
                            return DropdownMenuItem(
                              child: new Text(
                                document,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: document,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: Text("ADHAAR NUMBER *",style: TextStyle(
                        fontSize: 10
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(

                      controller: adhaarController,
                      validator: (text) {
                        if (text.trim().length < 2)
                          return "Adhaar Number Should not be blank.";
                        adhaar = adhaarController.text;
                        return null;
                      },
                      onSaved: (text) => adhaar = text,
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
                  if (adhaarimageFile != null)
                    AspectRatio(
                      aspectRatio: 487 / 400,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.file(
                          adhaarimageFile,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 25, bottom: 0.0),
                    child: new RaisedButton(
                        color: Color(0xfff2f3f5),
                        child: new Text('Upload Adhaar Card',
                            style: TextStyle(
                                color: Color(0xff114441),
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                            textAlign: TextAlign.left),
                        onPressed: () => {
                              _adhaarCard(context),
                            }),
                  ),
                  if (adhaarbackimageFile != null)
                    AspectRatio(
                      aspectRatio: 487 / 400,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.file(
                          adhaarbackimageFile,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 25, bottom: 0.0),
                    child: new RaisedButton(
                        color: Color(0xfff2f3f5),
                        child: new Text('Upload Adhaar Card Back',
                            style: TextStyle(
                                color: Color(0xff114441),
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                            textAlign: TextAlign.left),
                        onPressed: () => {
                              _adhaarbackCard(context),
                            }),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Ready to submit your application?',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Please verify the details you`re submitting. Once submitted , you won`t be able to change it unless you contact us ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        //fontWeight: FontWeight.w600
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
                            createAlbum(selectedSalutation,fname, lname, dob, address, state, city, pin, pan, adhaar, context);

                          } else {}
                        },
                        textColor: Colors.white,
                        color: Colors.green,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "SUBMIT & CONTINUE",
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
    );
  }
}
