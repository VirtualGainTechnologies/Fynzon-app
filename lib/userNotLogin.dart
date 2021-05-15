import 'package:flutter/material.dart';
import 'login.dart';
class NotLogin extends StatefulWidget {
  @override
  _NotLoginState createState() => _NotLoginState();
}

class _NotLoginState extends State<NotLogin> {
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF18222C),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Login ',
                style: TextStyle(color: Colors.white, fontSize: 18,),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue)),
            ),

          ],
        ),
      ),
    );
  }
}
