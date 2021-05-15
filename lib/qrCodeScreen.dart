import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'mainApi.dart';
import './tokenPass.dart';
import './qrCode.dart';

class Album {
  String message;
  String tempSecret;
  String dataURL;
  String tfaURL;

  Album({this.message, this.tempSecret, this.dataURL, this.tfaURL});

  Album.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    tempSecret = json['tempSecret'];
    dataURL = json['dataURL'];
    tfaURL = json['tfaURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['tempSecret'] = this.tempSecret;
    data['dataURL'] = this.dataURL;
    data['tfaURL'] = this.tfaURL;
    return data;
  }
}

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  Album futureAlbum;
  var file;
  Uint8List _bytes;
  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  fetchAlbum() async {
    /* var data = {

    };*/
    var apiData = {
      "url": AuthToken.api + "/" + "tfa/setup/" + AuthToken.authtoken,
      //"https://jsonplaceholder.typicode.com/albums/1",
      //"data": data
    };
    ApiClass.postApiCall(apiData, (onSuccess) {
      print(onSuccess.toString());
      // var id =  jsonDecode(onSuccess["response"]).toString();
      futureAlbum = Album.fromJson(jsonDecode(onSuccess['response']));
      // print("Dataget>>>>>>> " + futureAlbum.dataURL);
      _bytes = base64.decode(futureAlbum.dataURL.split(',').last);
      setState(() {});
    }, (onError) {
      print("Error working with the api");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF18222C),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Text(
                  'QR-Code',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Text(
                  'They are used to take a piece of information from a transitory media and put it in to your cell phone. ... The other key feature of QR Codes is that instead of requiring a chunky hand-held scanner to scan them,',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Container(child: FutureBuilder<Album>(
                //future: futureAlbum,
                builder: (context, snapshot) {
                  if (futureAlbum != null) {
                    return Image.memory(
                      _bytes,
                      scale: 0.8,
                    );
                    //Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              )

                  //Image.memory(_bytes,scale: 0.8,),
                  ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 20),
                child: Text(
                  'Secret Key',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: FutureBuilder<Album>(
                    //future: futureAlbum,
                    builder: (context, snapshot) {
                      if (futureAlbum != null) {
                        return Text(
                          futureAlbum.tempSecret,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        );
                        //Text(snapshot.data.title);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: RaisedButton(
                  child: Text("Next"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QRCodeDigit()),
                    );
                  },
                  color: Colors.grey,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  splashColor: Colors.orangeAccent,
                ),
              )
            ]),
      ),
    );
  }
}
