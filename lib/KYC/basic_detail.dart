
import 'package:flutter/material.dart';
import 'package:fyn_zon/KYC/selfi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_appbar.dart';
import 'common_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({Key key}) : super(key: key);

  @override
  _BasicDetailState createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {


  final globalKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool _isLoading1 = false;
  GlobalKey<FormState> _formKey = GlobalKey();

  var fName;
  var lName;
  @override
  void initState() {
    super.initState();
    shareData();

  }
  shareData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fName = prefs.getString("fname");
      lName = prefs.getString("lname");
      firstController.text = fName;
      lastController.text = lName;
      print(fName);
    });
  }

  TextEditingController firstController = new TextEditingController();
  TextEditingController lastController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController houseNoController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();
  TextEditingController landmarkController = new TextEditingController();
  TextEditingController countryController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();

  String first = "";String last = "";String dob = "";String address = "";String houseNo = "";String area = "";
  String street = "";String landmark = "";String country = "";String state = "";String city = "";String pincode = "";
  DateTime currentDate;
  var myFormat = DateFormat('yyyy-MM-dd');
   _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),);
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        dobController.text = myFormat.format(currentDate).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Personal Info'),
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

            child: Column(
              /*mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
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
                       /* Align(
                          alignment: Alignment.topLeft,
                          child: Text('GENERAL DETAIL',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.5,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        ),*/
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        /*SizedBox(
                          height: 15,
                        ),*/

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
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          controller: firstController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your name';
                            first = firstController.text;

                            return null;
                          },
                          onSaved: (text) => first = text,
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
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          controller: lastController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your Last name';
                            last = lastController.text;

                            return null;
                          },
                          onSaved: (text) => last = text,
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
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          readOnly: true,
                          controller: dobController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your DOB';
                            dob = dobController.text;

                            return null;
                          },
                          onSaved: (text) => dob = text,
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
                          keyboardType: TextInputType.text,
                          controller: addressController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your address';
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
                          height: 10,
                        ),
                        TextFormField(
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          controller: houseNoController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your house no.';
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
                          keyboardType: TextInputType.text,
                          controller: areaController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your area';
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
                          keyboardType: TextInputType.text,
                          controller: streetController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your street name';

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
                          keyboardType: TextInputType.text,
                          controller: landmarkController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your landmark';

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
                            if (text.isEmpty) return 'Please enter your country';

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
                                   controller: cityController,
                                   cursorColor: Colors.white,
                                   style: TextStyle(color: Colors.black),
                                   validator: (text) {
                                     if (text.trim().length < 2)
                                       return "Please enter the city";
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
                                   controller: stateController,
                                   cursorColor: Colors.white,
                                   style: TextStyle(color: Colors.black),
                                   validator: (text) {
                                     if (text.trim().length < 2)
                                       return "Please enter the state";
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
                          keyboardType: TextInputType.text,
                          controller: pincodeController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          validator: (text) {
                            if (text.isEmpty) return 'Please enter your name';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _isLoading
                        ?CircularProgressIndicator(
                        strokeWidth: 6.0,
                        backgroundColor: Colors.green,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                    ):
                    MaterialButton(
                      height: 30,
                      minWidth: 110,
                      onPressed: ()  async{
                     if (_formKey.currentState.validate()) {
                     _formKey.currentState.save();
                     String datePattern = "yyyy-MM-dd";
                     DateTime birthDate = DateFormat(datePattern).parse(dobController.text);
                     DateTime today = DateTime.now();
                     int yearDiff = today.year - birthDate.year;
                     int monthDiff = today.month - birthDate.month;
                     int dayDiff = today.day - birthDate.day;
                     print("today $today");
                     print("yearDiff $yearDiff");
                     print("monthDiff $monthDiff");
                     print("dayDiff $dayDiff");
                     if(yearDiff > 13 || yearDiff == 13 && monthDiff >= 0 && dayDiff >= 0){
                       print("success");
                       var rsp = await basicDetails(dob,address,houseNo,area,street,landmark, country, city,state,pincode);
                       var message = rsp['message'];
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
                         print("succ $error");
                         Fluttertoast.showToast(
                             msg:  message,
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                             backgroundColor: Colors.green,
                             textColor: Colors.white,
                             fontSize: 16.0);
                         SharedPreferences prefs = await SharedPreferences.getInstance();

                         prefs.setString('dob', dob);
                         prefs.setString('address', address);
                         prefs.setString('houseNo', houseNo);
                         prefs.setString('area', area);
                         prefs.setString('street', street);
                         prefs.setString('landmark', landmark);
                         prefs.setString('city', city);
                         prefs.setString('state', state);
                         prefs.setString('pincode', pincode);

                       }
                     }else{
                       Fluttertoast.showToast(
                           msg:  "Age is under 13",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.red,
                           textColor: Colors.white,
                           fontSize: 16.0);
                     }
                     return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;



                     }
                      },
                      //color:Color(0xFF144A7D),
                      color:Color(0xFF144A7D),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(

                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            //fontFamily: 'berlinsans',
                            color: Colors.white),
                      ),
                    ),



                    Container(
                      child: _isLoading1
                          ?CircularProgressIndicator(
                          strokeWidth: 6.0,
                          backgroundColor: Colors.green,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                      ):
                      MaterialButton(
                        height: 30,
                        minWidth: 110,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selfi()),
                          );
                        },
                        color:Color(0xFF144A7D),
                        //color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
