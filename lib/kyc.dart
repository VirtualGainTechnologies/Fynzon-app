import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyn_zon/tokenPass.dart';


import 'Model/user_data_model.dart';
import 'mainApi.dart';
import 'mainscreen.dart';

class KYC extends StatefulWidget {
  final String name, lastname,  state, city, pincode;
  KYC( this.name, this.lastname,  this.state, this.city,this.pincode, {Key key})
      : super(key: key);
  @override
  _KYCState createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  String selectedSalutation;
  String _selecteddocumnt;
  bool _isLoading = false;
  List<String> _country = ['India'];
  List<String> _document = ['ADHAAR'];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final globalKey = GlobalKey<ScaffoldState>();
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

  @override
  void initState() {
    super.initState();
    fetchAlbum();
    fnameController.text = widget.name;
    lnameController.text = widget.lastname;
    stateController.text = widget.state;
    cityController.text = widget.city;
    pinController.text = widget.pincode;


  }

  Future createAlbum( String selectedSalutation, String fname, String lname, String dob, String address, String state, String city, String pin, String pan, String adhaar, String panimage, String adhaarimage, String adhaarbackimage,) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = AuthToken.api + "/" + "client/updateProfile/" + prefs.getString('token');
    final response= await http.post(url,
        headers: {"Accept": "Application/json"},
        body: {
          "fname": fname,
          "lname": lname,
          "city": city,
          "state": state,
          "pinCode": pin,
          "country": selectedSalutation,
          "dob": dob,
          "address": address,
          "panNumber": pan,
          "adhaarNumber": adhaar,
          "panImage":panimage,
          "adhaarImage":adhaarimage,
          "adhaarBackImage" :adhaarbackimage
        }
    );

    var convertedDatatoJson =jsonDecode(response.body);
    return convertedDatatoJson;

  }
   /* Future<File> compressFile(File file) async{
      File compressedFile = await FlutterNativeImage.compressImage(file.path,
        quality: 5,);
      return compressedFile;
    }*/


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
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: picture.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);

    setState(() {
      panimageFile = compressedFile;
      print(panimageFile.lengthSync());
    });
    Navigator.of(context).pop();
  }

  Future _openpanCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);
    setState(() {
      panimageFile = compressedFile;
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
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: picture.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);
    this.setState(() {
      adhaarimageFile = compressedFile;
    });
    Navigator.of(context).pop();
  }

  Future _openadhaarCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);
    setState(() {
      adhaarimageFile = compressedFile;
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
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: picture.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);
    this.setState(() {
      adhaarbackimageFile = compressedFile;
    });
    Navigator.of(context).pop();
  }

  Future _openadhaarbackCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera,
       );
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
    );
    File compressedFile = await FlutterNativeImage.compressImage(croppedFile.path,
      quality: 50,);
    setState(() {
      adhaarbackimageFile = compressedFile;
    });
    Navigator.of(context).pop();
  }
  Autogenerated futureAlbum;
  var userid;

  fetchAlbum() async {
    /* var data = {

    };*/
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('userid');
    });
    //AuthToken.authtoken = token;*/
    var apiData = {
      "url": AuthToken.api + "/" + "client/userDetails/" + prefs.getString('token'),
      //"data": data
    };
    ApiClass.getApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      futureAlbum = Autogenerated.fromJson(jsonDecode(onSuccess['response']));
      print("lalit acc>>>>>>> " + futureAlbum.data.bankAccNo.toString());
      setState(() {

      });
    }, (onError) {
      print("Error working with the api");
    });
  }
  DateTime _selectedDate;

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dobController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dobController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
       // backgroundColor: Color(0xFF18222C),
          key: _scaffoldKey,
          backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF18222C),
          title: Text('KYC'),
        ),
        body:
        /*futureAlbum.data.kycApproved == true ?
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blueGrey,
                title: Text("KYC Approved"),
                content: Text("Your KYC is already Approved !"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Ok",style: TextStyle(
                        color: Colors.white
                    ),),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MainScreenPage()));
                      *//* Navigator.of.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(),
                          ),
                        );*//*
                    },
                  ),
                  *//* FlatButton(
                      child: Text("NO",style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )*//*
                ],
              );
            }
        ):
*/
        Form(
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
                      readOnly: true,
                      onTap: (){
                        _selectDate(context);
                      },
                      validator: (text) {
                        if (text.isEmpty)
                          return "D.O.B Should not be blank.";
                        dob = dobController.text;
                        return null;
                      },
                      onSaved: (text) => dob = text,
                      autocorrect: true,
                      autofocus: false,
                      //keyboardType: TextInputType.visiblePassword,
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
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 6,
                      //cursorHeight: 18,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                      keyboardType: TextInputType.multiline,
                      minLines: 1,maxLines: 5,
                      //cursorHeight: 18,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                      keyboardType: TextInputType.multiline,
                      minLines: 1,maxLines: 5,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                        if (text.isEmpty)
                          return 'Please enter pinCode';
                        RegExp regExp = new RegExp("^[1-9][0-9]{5}");
                        if (!regExp.hasMatch(text))
                          return 'Please enter valid pinCode'
                              .toLowerCase();
                        pin = pinController.text;
                        return null;
                      },
                      onSaved: (text) => pin = text,
                      autocorrect: true,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      //cursorHeight: 18,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                        if (text.isEmpty)
                          return 'Please enter pan number';
                        String patttern =
                            "[A-Z]{5}[0-9]{4}[A-Z]{1}";
                        RegExp regExp = new RegExp(patttern);
                        if (!regExp.hasMatch(text))
                          return 'Please enter valid Pan number'
                              .toLowerCase();
                        pan = panController.text;
                        return null;
                      },
                      onSaved: (text) => pan = text,
                      autocorrect: true,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,maxLines: 5,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                        if (text.isEmpty)
                          return 'Please enter adhar number';
                        RegExp regExp = new RegExp("^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}");
                        if (!regExp.hasMatch(text))
                          return 'Please enter valid adhar number'
                              .toLowerCase();
                        adhaar = adhaarController.text;
                        return null;
                      },
                      onSaved: (text) => adhaar = text,
                      autocorrect: true,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,maxLines: 5,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          //height: 0.5,
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
                        onPressed: () async{
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            setState(()=> _isLoading = true);

                            String panImage = base64Encode(panimageFile.readAsBytesSync());
                            String adharfrontImage = base64Encode(adhaarimageFile.readAsBytesSync());
                            String adharbackImage = base64Encode(adhaarbackimageFile.readAsBytesSync());

                            var rsp = await createAlbum(selectedSalutation,fname, lname, dob, address, state, city, pin, pan, adhaar,
                                panImage, adharfrontImage, adharbackImage,);
                            var data = rsp['data'];
                            var message = rsp['message'];
                            var error = rsp['error'];
                            if (error == true) {
                              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                                content: new Text(
                                  message,
                                  style: TextStyle(color: Colors.red),
                                ),
                                duration: new Duration(seconds: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                                ),
                              ));
                              setState(()=> _isLoading = false);
                            }else{
                              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                                content: new Text(
                                  message,
                                  style: TextStyle(color: Colors.green),
                                ),
                                duration: new Duration(seconds: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                                ),
                              ));
                              setState(()=> _isLoading = false);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreenPage()),
                              );
                            }
                          } else {

                          }
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
