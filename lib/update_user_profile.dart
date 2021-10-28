
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyn_zon/mainscreen.dart';
import 'package:fyn_zon/tokenPass.dart';
import 'KYC/common_api.dart';
import 'custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import '../custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({Key key}) : super(key: key);

  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  final globalKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool _isLoading1 = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController addressController = new TextEditingController();
  TextEditingController houseNoController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();
  TextEditingController landmarkController = new TextEditingController();
  TextEditingController countryController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();

 String address = ""; String houseNo =""; String area = "";
  String street = "";String landmark = "";String country = "";String state = "";String city = "";String pincode = "";

  var fname,lname,email,dob, image;
  File adharimageFile;
  @override
  void initState() {
    super.initState();
    get_User();
  }


  get_User()async{
    var rsp = await getUser();
    var message = rsp['message'];
    var data = rsp['data'];
    var record = data['record'];
     var fn = record['fname'];
    var error = rsp['error'];
    if(error == "true"){
      print("failed $error");
      Fluttertoast.showToast(
          msg:  message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }else{
     setState(() {
       fname = fn.toString();
       lname = record['lname'].toString();
       email = record['email'].toString();
       dob = record['dob'].toString();
       image = record['image_URL'].toString();
     });
      print(dob);
      addressController.text = record['address'];;
      houseNoController.text = record['house_no'];
      areaController.text = record['area'];
      streetController.text = record['street_name'];
      landmarkController.text = record['landmark'];
      countryController.text = record['country'];
      stateController.text = record['state'];
      cityController.text = record['city'];
      pincodeController.text = record['pinCode'];
      print("succ $error");
      Fluttertoast.showToast(
          msg:  message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }



  Future<String> update(
      String address
          ,String houseNo,String area, String streetName, String landmark, String country,
  String state,String city,String pincode,
      File path ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = AuthToken.api+"/"+"kyc/v2/userProfile/"+prefs.getString('token');
    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.fields['address'] = address;
    request.fields['houseNo'] = houseNo;
    request.fields['area'] = area;
    request.fields['landmark'] = landmark;
    request.fields['streetName'] = streetName;
    request.fields['country'] = country;
    request.fields['state'] = state;
    request.fields['city'] = city;
    request.fields['pinCode'] = pincode;
    request.files.add(await http.MultipartFile.fromPath(
      'selfie', path.path,
    ));
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    print(">>>>upload/>>>>$respStr");
    var json = jsonDecode(respStr);
    var error = json["error"];
    var message = json["message"];
    print(error);
    if(error == "true"){
      Fluttertoast.showToast(
          msg:  message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
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
            builder: (context) =>
                MainScreenPage()),
      );
    }
    print(json);

    return res.reasonPhrase;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Profile Update'),
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
          ),
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child:

            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('FIRST NAME',
                                      style: TextStyle(
                                        fontSize: 13,
                                        letterSpacing: 0.5,
                                        //fontFamily: 'berlinsans',
                                        color: Colors.black,
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.topLeft,
                                    child: fname == null ? Container(height: 16,):Text(fname,style: TextStyle(
                                        fontSize: 16
                                    ),),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.lightBlueAccent.shade100),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('LAST NAME',
                                      style: TextStyle(
                                        fontSize: 13,
                                        letterSpacing: 0.5,
                                        //fontFamily: 'berlinsans',
                                        color: Colors.black,
                                      ),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.topLeft,
                                    child: lname == null ? Container(height: 16,):Text(lname,style: TextStyle(
                                      fontSize: 16
                                    ),),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.lightBlueAccent.shade100),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                image == null ?Container(
                                  margin: EdgeInsets.only(left: 40,right: 10),
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: adharimageFile != null ?
                                      FileImage(File(adharimageFile.path)):
                                      //NetworkImage(image),
                                      NetworkImage("https://cdn-icons-png.flaticon.com/512/149/149071.png")
                                    ),
                                  ),
                                ):
                                Container(
                                  margin: EdgeInsets.only(left: 40,right: 10),
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: adharimageFile != null ?
                                      FileImage(File(adharimageFile.path)):
                                      NetworkImage(image),
                                      //NetworkImage("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                                    ),
                                  ),
                                ),
                               SizedBox(
                                 height: 10,
                               ),
                               GestureDetector(
                                 onTap: (){
                                   _panCard(context);
                                 },
                                 child: Container(
                                   padding: EdgeInsets.all(3),
                                   margin: EdgeInsets.only(left: 30),
                                   alignment: Alignment.topRight,
                                   decoration: BoxDecoration(
                                     color: Colors.blue,
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: Colors.blue)
                                   ),
                                   child: Row(
                                     children: [
                                   Text('Change Image',style: TextStyle(fontSize: 11,color: Colors.white),),
                                   Icon(Icons.edit,size: 15,color: Colors.white,),
                                     ],
                                   ),
                                 ),
                               ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('EMAIL ID',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: email == null ? Container(height: 16,):Text(email,style: TextStyle(
                              fontSize: 16
                          ),),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.lightBlueAccent.shade100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('DATE OF BIRTH',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: dob == null ? Container(height: 16,):Text(dob),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.lightBlueAccent.shade100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('ADDRESS',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,
                          controller: addressController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Address';
                            address = addressController.text;

                            return null;
                          },
                          onSaved: (text) => address = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('HOUSE NO.',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,
                          controller: houseNoController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your house no';
                            houseNo = houseNoController.text;

                            return null;
                          },
                          onSaved: (text) => houseNo = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('AREA',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,

                          controller: areaController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Area';
                            area = areaController.text;

                            return null;
                          },
                          onSaved: (text) => area = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('STREET NAME',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,

                          controller: streetController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Street Name';
                            street = streetController.text;

                            return null;
                          },
                          onSaved: (text) => street = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('LANDMARK',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,

                          controller: landmarkController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Landmark';
                            landmark = landmarkController.text;

                            return null;
                          },
                          onSaved: (text) => landmark = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('COUNTRY',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          controller: countryController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your county';

                            country = countryController.text;

                            return null;
                          },
                          onSaved: (text) => country = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('CITY',
                                    style: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 0.5,
                                      //fontFamily: 'berlinsans',
                                      color: Colors.black,
                                    ),),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    autofocus: false,
                                    keyboardType: TextInputType.multiline,

                                    controller: cityController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.isEmpty) return 'Please enter your City';
                                      city = cityController.text;
                                      return null;
                                    },
                                    onSaved: (text) => city = text,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                ),




                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('STATE',
                                    style: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 0.5,
                                      //fontFamily: 'berlinsans',
                                      color: Colors.black,
                                    ),),
                                ),
                                SizedBox(
                                  height: 5,
                                ),


                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    autocorrect: true,
                                    autofocus: false,
                                    keyboardType: TextInputType.multiline,

                                    controller: stateController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    validator: (text) {
                                      if (text.trim().isEmpty)
                                        return "Please Enter Your State";
                                      state = stateController.text;
                                      return null;
                                    },
                                    onSaved: (text) => state = text,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                ),







                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),Align(
                          alignment: Alignment.topLeft,
                          child: Text('PIN CODE',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          controller: pincodeController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Pin code';
                            String pattern = r'(^[1-9][0-9]{5}$)';
                            RegExp regExp = new RegExp(pattern);
                            if (!regExp.hasMatch(text))
                              return 'Please enter Correct Pin code';

                            pincode = pincodeController.text;

                            return null;
                          },
                          onSaved: (text) => pincode = text,
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),



                      ],
                    ),
                  ),
                ),
       Container(
           padding: EdgeInsets.only(
               left: 30, right: 30, top: 10, bottom: 10),
         child:  _isLoading
             ?CircularProgressIndicator(
             strokeWidth: 6.0,
             backgroundColor: Colors.green,
             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
         ):
         MaterialButton(
           height: 40,
           minWidth: 210,
           onPressed: ()  async{
             if (_formKey.currentState.validate()) {
               _formKey.currentState.save();
               update(address,houseNo,area,street,landmark, country,state, city, pincode, adharimageFile);
             };
           },
           //color:Color(0xFF144A7D),
           color:Color(0xFF144A7D),
           elevation: 0,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30)),
           child: Text(
             "UPDATE",
             style: TextStyle(

                 fontSize: 16,
                 fontWeight: FontWeight.w600,
                 //fontFamily: 'berlinsans',
                 color: Colors.white),
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

  TextEditingController uploadfrontController = TextEditingController();
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
      adharimageFile = compressedFile;
      uploadfrontController.text = adharimageFile.path;
      print(adharimageFile.lengthSync());
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
      adharimageFile = compressedFile;
      uploadfrontController.text = adharimageFile.path;
    });
    Navigator.of(context).pop();
  }
}

