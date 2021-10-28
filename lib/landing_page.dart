
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Card(
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Get free INR 100 in your wallet.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5,),
              Text('*T&C', style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5,),
              Text('-  Just download the App',style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5,),
              Text('-  Write a Review 📝',style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5,),
              Text('-  Complete Registration ( sign up + kyc )🧑🏼‍💻',style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5,),
              Text('-  Share over social media 📲',style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
