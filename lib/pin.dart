import 'package:flutter/material.dart';
import 'package:fyn_zon/api/api.dart';
import 'package:fyn_zon/login.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:fyn_zon/otp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Forgot_PIN/forgotScreen.dart';
import 'custom_appbar.dart';

class PinPage extends StatefulWidget {
  @override
  String phone_number;
  PinPage(this.phone_number);
  State<StatefulWidget> createState() {
    return PinPageState(this.phone_number);
  }
}

class PinPageState extends State<PinPage> {
  @override
  String phone_number;
  String user_id;
  bool _isLoading = false;
  bool _passwordVisible = false;
  int _otpCodeLength = 4;

  bool images = true;

  @override
  void initState() {
    _passwordVisible = false;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  PinPageState(this.phone_number);
  TextEditingController pinController = new TextEditingController();
  String pin ="";
  void showInSnackBar() {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        'User not Exits',
        style: TextStyle(color: Colors.red),
      ),
      duration: new Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
    ));
  }
  String _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  void showInSnackBar1() {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        'Logged In Successfully ',
        style: TextStyle(color: Colors.red),
      ),
      duration: new Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
    ));
  }
  void _moveToSignInScreen(BuildContext context) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpPage(phone_number),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //Navigator.pop(context);
        _moveToSignInScreen(context);
      },
      child: Scaffold(
        appBar: appBar('PIN Authentication'),
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                /*mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,*/
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 00),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("./assets/images/fynzon_logo.png",
                            height: 40,),
                          Image.asset("./assets/images/fynzon_text.png",width: 170,
                            height: 60,),

                        ])
                  ),

                 Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.all(15),

                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         child: Divider(
                           color: Colors.grey.shade200,
                           thickness: 1.5,
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       images == true ?
                       Image.asset("./assets/images/check.png",width: 170, height: 60,):
                       Image.asset("./assets/image/pin not match.png",width: 170, height: 60,),
                       SizedBox(
                         height: 30,
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 50),
                         child: Text(
                           "Mobile Number verified!",
                           textAlign: TextAlign.center,
                           style: TextStyle(fontSize: 16,
                               letterSpacing: 0.5,
                               color: Colors.black),
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Text(
                         "+91 $phone_number",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 20,
                             color: Colors.black,
                             letterSpacing: 3,
                             fontFamily: 'berlinsans',
                             ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 50),
                         child: Text(
                           "Enter 4 digit PIN",
                           textAlign: TextAlign.center,
                           style: TextStyle(fontSize: 16,
                               letterSpacing: 0.5,
                               fontFamily: 'berlinsans',
                               color: Colors.black54),
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),

                       PinCodeFields(
                         length: 4,
                         fieldBorderStyle: FieldBorderStyle.Square,
                         responsive: false,
                         fieldHeight:40.0,
                         fieldWidth: 40.0,
                         borderWidth:1.0,
                         controller: pinController,
                         obscureCharacter: "*",
                         obscureText: true,
                         //activeBorderColor: Colors.pink,
                         activeBackgroundColor: Colors.white,
                         borderRadius: BorderRadius.circular(8.0),
                         keyboardType: TextInputType.number,
                         autoHideKeyboard: true,
                         fieldBackgroundColor: Colors.white,
                         borderColor: Colors.grey.shade400,
                         textStyle: TextStyle(
                             color: Colors.black,
                             fontSize: 18,
                         ),
                         onComplete: (output) {
                           // Your logic with pin code
                             if (output.isEmpty)
                               return "Enter Pin";
                             if (output.trim().length != 4)
                               return "Enter Correct Pin";

                             pin = pinController.text;
                             return null;
                           print(output);
                         },
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         child: Divider(
                           color: Colors.grey.shade200,
                           thickness: 1.5,
                         ),
                       ),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     ForgotScreen()),
                           );
                         },
                         child: Container(
                           alignment: Alignment.center,
                           // margin: EdgeInsets.only(top: 15),
                           child: Text('Forgot PIN',style: TextStyle(
                             color:Color(0xFF144A7D),
                             fontSize: 17,
                             letterSpacing: 0.4,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'berlinsans',

                           ),),
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 30),
                         child: Text(
                           "Please do not share your PIN with anyone including people from Fynzon",
                           textAlign: TextAlign.center,
                           style: TextStyle(fontSize: 14,
                               letterSpacing: 0.5,
                               color: Colors.black),
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Padding(
                         // padding: EdgeInsets.symmetric(horizontal: 40),
                         padding: EdgeInsets.only(top: 3, left: 45,right: 45,),

                         child: _isLoading
                             ?CircularProgressIndicator(
                             strokeWidth: 6.0,
                             backgroundColor: Colors.green,
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                         ):
                         MaterialButton(
                           minWidth: 110,
                           height: 30,
                           onPressed: () async {
                             if (_formKey.currentState.validate()) {
                               _formKey.currentState.save();
                               setState(() => _isLoading = true);
                               FocusScope.of(context).requestFocus(FocusNode());
                               var pin = pinController.text;

                               var rsp = await loginUser(phone_number, pin);
                               var data = rsp['data'];
                               var error = rsp['error'];
                               if (error == "true") {
                                 print("error");
                                 setState(() {
                                   images = false;
                                 });
                                 Fluttertoast.showToast(
                                     msg:  'User not Exits',
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.red,
                                     textColor: Colors.white,
                                     fontSize: 16.0);
                                 //showInSnackBar();
                                 setState(() => _isLoading = false);
                               } else {

                                 setState(() {
                                   images = true;
                                 });
                                 print(data);
                                 var user_id = data['userid'];
                                 var token = data['token'];
                                 var fname = data['firstName'];
                                 var lname = data['lastName'];
                                 var email = data['email'];
                                 var phone = data['phone'];
                                 SharedPreferences prefs = await SharedPreferences.getInstance();

                                 prefs.setString('userid', user_id);
                                 prefs.setString('token', token);
                                 prefs.setString('fname', fname);
                                 prefs.setString('lname', lname);
                                 prefs.setString('email', email);
                                 prefs.setString('phone', phone.toString());

                                 setState(() => _isLoading = false);
                                 Navigator.of(context).pop();
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => MainScreenPage()),
                                 );
                                 setState(() {

                                 });
                               }
                             }
                           },
                           color:Color(0xFF144A7D),
                           elevation: 0,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5)),
                           child: Text(
                             "Login",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16,
                                 color: Colors.white),
                           ),
                         ),
                       ),

                       SizedBox(
                         height: 20,
                       )
                     ],
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
