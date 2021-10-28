
import 'package:flutter/material.dart';
import 'package:fyn_zon/Forgot_PIN/email_forgot_pin.dart';

class SendPinEmail extends StatefulWidget {
  const SendPinEmail({Key key}) : super(key: key);

  @override
  _SendPinEmailState createState() => _SendPinEmailState();
}

class _SendPinEmailState extends State<SendPinEmail> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailForgotPin(),
          ),
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(10.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Forgot PIN',style: TextStyle(
                              fontSize: 20,
                              //fontFamily: 'berlinsans',
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset("./assets/images/security.png",width: 170,
                          height: 60,),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'A magic link is send to ',
                              style: TextStyle( fontSize: 16,
                                  fontFamily: 'berlinsans',
                                  letterSpacing: 0.6,
                                  color: Colors.black87),
                              children: const <TextSpan>[
                                TextSpan(text: 'lalit@gmaill.com',  style: TextStyle( fontSize: 16,
                                    fontFamily: 'berlinsans',
                                    letterSpacing: 0.6,
                                    color: Colors.lightBlueAccent),),
                                TextSpan(text: ' for resetting your PIN', style: TextStyle( fontSize: 16,
                                    fontFamily: 'berlinsans',
                                    letterSpacing: 0.6,
                                    color: Colors.black87),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
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
}


