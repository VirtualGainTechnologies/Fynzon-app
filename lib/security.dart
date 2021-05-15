import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF18222C),
        title: Image.asset("./assets/fynzon_logo.png",scale: 27.0,),
        actions: [
          FlatButton(
            color: Colors.yellow,
            textColor: Colors.black,
            onPressed: () {},
            child: Text("CONTACT US",textScaleFactor: 0.9,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0,top: 25.0,bottom: 25.0),
              child: Row(
                
                children:[
                  Container(
                   // padding: EdgeInsets.all(25.0),
                   // alignment: Alignment.topLeft,*/
                    child: Text('FynZon',
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.cyan
                      ),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    alignment: Alignment.topLeft,
                    child: Text('>',
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.cyan
                      ),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                   // alignment: Alignment.topLeft,*/
                    child: Text('Security',
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.cyan
                      ),),
                  ),
                ]
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 10),
              //alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  icon: Icon(Icons.search),
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Colors.white,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Securing your FynZon account - Tips & Best Practices',
                style: TextStyle(
                    fontSize: 35.0
                ),),
            ),
            Padding(
              padding: EdgeInsets.only( left: 20.0),
              child: Row(
                children: [
                  Container(
                     padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.topLeft,
                    child: Image.asset("./assets/images/fz_logo.png",scale: 2.0,),
                  ),
                  Column(
                   children: [
                     Container(
                       //padding: EdgeInsets.all(20.0),
                       alignment: Alignment.topLeft,
                       child: Text('FynZon',
                         style: TextStyle(
                             fontSize: 13.0,
                           color: Colors.black
                         ),),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 13),
                       alignment: Alignment.topLeft,
                       child: Text('1 year ago',
                         style: TextStyle(
                             fontSize: 12.0,
                           color: Colors.grey[800]
                         ),),
                     ),
                   ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Keeping your FynZon account and funds safe is always our top most priority. You form an important part of the effort and together we can keep FynZon as the most secure exchange in India. Below are some important best practices you should follow to keep your WazirX account secure.',
                style: TextStyle(
                    fontSize: 16.0,
                  height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Using the right FynZon',
                style: TextStyle(
                    fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70.0,right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.5,
                    height: 1.5
                  ),
                  children: [
                    new TextSpan(text: 'Make sure you have downloaded the right FynZon App. On the Playstore & App Store the app is called `FynZon`and the developer name is',
                    style: TextStyle(
                      color: Colors.black87
                    )),
                    new TextSpan(text: ' Zanmai Labs Pvt Ltd. ',
                        style: new TextStyle(
                            color: Colors.black,
                        fontWeight: FontWeight.w800
                        )),
                    new TextSpan(text: 'Direct Links :',
                    style: TextStyle(
                      color: Colors.black87
                    )),
                  ],
                ),
              ),

            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Android -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch(' https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Ios -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch(' https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Web -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch(' https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Mac App -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch(' https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Windows -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch(' https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Download and Install the app ONLY via Playstore and App Store. Never download from any other sources.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('If you are trading via the website, ensure the domain is FynZon.com',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('When you receive emails from WazirX, check if the email ID is @fynzon.com',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Password',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Always Set a strong password for your account',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Passwords must be atleast 6 characters long and a maximum of 64 characters. We recommend using passwords longer than 10 characters.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Include a combination of characters, numbers and symbols like in your password',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never use common words as passwords. For eg your name or birthdate or your pet,s name',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('When you receive emails from FynZon, check if the email ID is @fynzon.com',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never use a password that you have used elsewhere. For eg - your email password, your facebook password or even your password for another cryptocurrency exchange',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never share your password with anyone else. FynZon will never call or email you asking for your password. Nobody needs your password to help you with a problem.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('You should also follow the above tips to secure the email ID that you have registered with your FynZon account.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Two Factor Authentication (2FA) & OTP',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Always enable 2FA on your account. We highly recommend using an app based 2FA like Google Authenticator.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('When setting up 2FA, store the secret key in a very safe place. Never store it on your device or email',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never share your 2FA app or device with anyone else.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never share your 2FA Code/OTP with anyone else. Even if someone claims they,re contacting you from WazirX. We never need your OTP to help you with any problem.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70.0,right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                      fontSize: 14.5,
                      height: 1.5
                  ),
                  children: [
                    new TextSpan(text: 'If you have received an OTP on your phone without requesting for one, please',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                    new TextSpan(text: '  contact ',
                        style: new TextStyle(
                            color: Colors.blue,
                            //fontWeight: FontWeight.w800
                        )),
                    new TextSpan(text: 'our support team immediately. ',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                  ],
                ),
              ),

            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Account Details',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70.0,right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                      fontSize: 14.5,
                      height: 1.5
                  ),
                  children: [
                    new TextSpan(text: 'Never share account details like your',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                    new TextSpan(text: '  registered FynZon email ID, mobile number, bank details, Transaction number or amount ',
                        style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800
                        )),
                    new TextSpan(text: 'publicly. Only share it with the support team if asked through official channels like the ',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                    new TextSpan(text: 'support.FynZon.com ',
                        style: TextStyle(
                            color: Colors.blue
                        )),
                  ],
                ),
              ),

            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Devices',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70.0,right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                      fontSize: 14.5,
                      height: 1.5
                  ),
                  children: [
                    new TextSpan(text: 'If you are using the WazirX iOS or Android App, enable the',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                    new TextSpan(text: ' Passcode ',
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                    new TextSpan(text: 'feature from the',
                        style: TextStyle(
                            color: Colors.black87
                        )),
                    new TextSpan(text: ' Security Menu. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        )),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Keep your phone OS updated to the latest version. Your OS makes regular security updates so its important that you stay updated with the latest fixes.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Setup fingerprint recognition, passcode or any other access security features that you phone may support',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('If possible, enable features that wipe out your phone incase it is lost.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Avoid jailbreaking your phone as that may compromise the phones security updates.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Install a good antivirus software on your computer but dont depend entirely on it.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),

            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Avoid installing too many softwares or browser extensions.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Do not download or install files you dont trust. Especially if they download automatically or are sent as an email attachment',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Only connect to WIFI & Internet networks that you are familiar with and fully trust. Keep your home WIFI networks password protected',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Crypto Deposits & Withdrawals',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Always cross check the deposit address that you have copied when you paste it into the withdrawal wallet. ',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('General Advice',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Avoid operating your FynZon account on public computers like cyber cafes.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Always log out of your FynZon account if someone else uses the same device.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Avoid sharing details of your investments in public channels like telegram, whatsapp, forums etc. Dont disclose your cryptocurrency holdings to anyone in public.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Never send money to anyone claiming to be representing WazirX. We will never ask you to send money to random addresses or accounts.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: Text('Setup 2FA for the email ID that you use for trading. For eg - Gmail, Outlook etc.',
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5
                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('Official FynZon Accounts/Links',
                style: TextStyle(
                  fontSize: 24.0,

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Text('The following are official WazirX accounts on social media and other platforms. We advice you to please not interact with any other accounts.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5

                ),),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Website -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' FynZon.com',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('FynZon.com');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Android App -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'iOS App -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Mac App -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Windows  -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Telegram Announcement Channel -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Telegram Discussion Group -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://play.google.com/store/apps/details?id=com.wrx.wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://play.google.com/store/apps/details?id=com.wrx.wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Twitter -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://twitter.com/wazirxindia',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://twitter.com/wazirxindia');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 70, right: 20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Facebook -  ',
                      style: new TextStyle(color: Colors.black87,height: 1.5),

                    ),
                    new TextSpan(
                      text: ' -https://www.facebook.com/wazirx',
                      style: new TextStyle(color: Colors.blue,height: 1.5),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () { launch('https://www.facebook.com/wazirx');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 0.0,top: 80),
              alignment: Alignment.topLeft,
              child: Row(

                children: [
                  Image.asset("./assets/images/fz_fb.png",scale: 7.0,),
                  SizedBox(width: 5),
                  Image.asset("./assets/images/fz_tw.png",scale: 7.0,),
                  SizedBox(width: 5),
                  Image.asset("./assets/images/fz_in.png",scale: 7.0,),
                  SizedBox(width: 5),
                ],
              )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Divider(
                  color: Colors.grey,
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                alignment: Alignment.center,
                child: Text('Was this article helpful?',style: TextStyle(
                    fontSize: 15
                ),)
            ),
            Container(
                //padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(right:5),
                      child: RaisedButton.icon(

                        onPressed: (){ print('Button Clicked.'); },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Yes',
                          style: TextStyle(color: Colors.blue),),
                        icon: Icon(Icons.check, color:Colors.blue,),
                        textColor: Colors.white,
                        splashColor: Colors.blue,
                        color: Colors.white,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: RaisedButton.icon(
                        onPressed: (){ print('Button Clicked.'); },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('No',
                          style: TextStyle(color: Colors.blue),),
                        icon: Icon(Icons.check, color:Colors.blue,),
                        textColor: Colors.white,
                        splashColor: Colors.blue,
                        color: Colors.white,),
                    ),

                  ],
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                alignment: Alignment.topLeft,
                child: Divider(
                  color: Colors.grey,
                )
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20,right: 20),
              alignment: Alignment.topLeft,
              child: Row(
               children: [
                 Text('Return to top',
                   style: TextStyle(
                       fontSize: 16.0,
                       height: 1.5

                   ),),
                 Icon(Icons.keyboard_arrow_up)
               ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                alignment: Alignment.topLeft,
                child: Divider(
                  color: Colors.grey,
                )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Text('Related articles',style: TextStyle(
                    fontSize: 16
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                alignment: Alignment.topLeft,
                child: Text('Two-Factor Authentication (2FA) - Setup, Change & Recovery',style: TextStyle(
                    fontSize: 16,
                  color: Colors.blue
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                alignment: Alignment.topLeft,
                child: Text('WRX Mining - Unlock & Earn upto 10,000 WRX Coins Daily!',style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                alignment: Alignment.topLeft,
                child: Text('Guide to Signing Up & KYC Verification',style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                alignment: Alignment.topLeft,
                child: Text('How can I close my WazirX account?',style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                alignment: Alignment.topLeft,
                child: Text('What is my WRX balance?',style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                ),)
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 80),
                alignment: Alignment.topLeft,
                child: Divider(
                  color: Colors.grey,
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15, bottom: 30),
                color: Colors.grey[100],
                alignment: Alignment.bottomCenter,
                child: Text('FynZon    Trading, Deposit & Withdrawal Fees',style: TextStyle(
                    fontSize: 16,

                ),)
            ),
          ],
        ),
      ),
    );
  }
}
