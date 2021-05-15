import 'package:flutter/material.dart';
class UPI extends StatefulWidget {
  @override
  _UPIState createState() => _UPIState();
}

class _UPIState extends State<UPI> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController upiController = new TextEditingController();
  var upi ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 5,right: 5,top: 10),
            child: Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20,),
                      child: Text('Add your UPI / VPA ID for UPI payments',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("UPI / VPA ID",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                        controller: upiController,
                        validator: (text) {
                          if (text.trim().length < 2)
                            return "Upi Should not be blank.";
                          upi = upiController.text;
                          return null;
                        },
                        onSaved: (text) => upi = text,

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
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: new RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          } else {}
                        },
                        textColor: Colors.white,
                        color: Colors.green,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "SUBMIT",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
