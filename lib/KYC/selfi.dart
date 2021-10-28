import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyn_zon/KYC/panCard.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../custom_appbar.dart';
import '../tokenPass.dart';
import 'common_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

class Selfi extends StatefulWidget {
  const Selfi({Key key}) : super(key: key);

  @override
  _SelfiState createState() => _SelfiState();
}

class _SelfiState extends State<Selfi> {
  final globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  bool _isLoading1 = false;

  File panimageFile;

  TextEditingController panController = new TextEditingController();
  TextEditingController uploadImageController = TextEditingController();
  String pan = "";

  Future<String> uploadImage(File path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = AuthToken.api+"/"+"kyc/v2/userPic/"+prefs.getString('token');
    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('selfie', path.path));
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    print(">>>>upload/>>>>$respStr");
    var json = jsonDecode(respStr);
    var error = json["error"];
    var message = json["message"];
    print(error);
    if(error == "true"){
      Fluttertoast.showToast(
          msg:  "er$message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      Fluttertoast.showToast(
          msg:  "er1$message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print(json);

    return res.reasonPhrase;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Selfie'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.all(8),
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('SELFIE',
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  //fontFamily: 'berlinsans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          panimageFile==null? Container(
                            height: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            //child: Image.asset("./assets/images/pancard.png",fit: BoxFit.fill,),
                          ):
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: FileImage(File(panimageFile.path)),fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: _isLoading
                                ?CircularProgressIndicator(
                                strokeWidth: 6.0,
                                backgroundColor: Colors.green,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                            ):
                            MaterialButton(
                              height: 30,
                              minWidth: 110,
                              onPressed: () async {
                                _panCard(context);
                              },
                              color:Color(0xFF144A7D),
                              //color: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "UPLOAD",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ]


                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: _isLoading
                          ?CircularProgressIndicator(
                          strokeWidth: 6.0,
                          backgroundColor: Colors.green,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                      ):
                      MaterialButton(
                        height: 30,
                        minWidth: 110,
                        onPressed: () async{
                          if(panimageFile == null){
                            Fluttertoast.showToast(
                                msg:  "Select User Image",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                          uploadImage(panimageFile);}
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
                                builder: (context) => PanCard()),
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
      uploadImageController.text = panimageFile.path;
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
      uploadImageController.text = panimageFile.path;
    });
    Navigator.of(context).pop();
  }

}
