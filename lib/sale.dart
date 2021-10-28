import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fyn_zon/postSaleorder.dart';
import 'package:fyn_zon/animation/FadeAnimation.dart';
import 'mainscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SalePage extends StatefulWidget {
  String base, tread;
  var price;

  SalePage({
    Key key,
    @required this.base,
    @required this.tread,
    @required this.price,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SalePageState();
  }
}

class SalePageState extends State<SalePage> {
  final _formKey = GlobalKey<FormState>();
  var usdtController = new TextEditingController();
  var btcController = new TextEditingController();
  var totalusdtController = new TextEditingController();
  var usdt = "";
  var btc = "";
  var totalusdt = "";
  var result = "0";
  int _value = 1;
  var rsp;
  var INR;
  var num, num1;
  var usdtValue,btcValue;
  var value,value1;
  String base, tread;
  String iNR="INR";
  double result1;
  bool _isLoading = false;
  var _itemCount = 0;
  var _itemCount1 = 0;
  var price;
  @override
  void initState() {
    super.initState();
    usdtController.text = widget.price;
    //btcController.text = "0";

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF233446),
      body: Container(
        decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/bg.png"), fit: BoxFit.cover,),
        ),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    /* Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.topRight,
                          //padding: EdgeInsets.all(20.0),
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xFF18222C),
                              border: Border.all(
                                color: Color(0xFF18222C),

                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: 120,
                          child: DropdownButton(
                              value: _value,
                              dropdownColor: Color(0xFF18222C),
                              focusColor: Color(0xFF18222C),
                              isExpanded: false,
                              underline: Container(color: Colors.transparent),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Limit",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Stop Limit",style: TextStyle(color: Colors.grey),),
                                  value: 2,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        ),
                      ),*/
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                      padding: EdgeInsets.only(top:
                      50),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(children: <Widget>[
                              Text(
                                "AT PRICE",
                                style: TextStyle(
                                    fontSize: 10.0, fontWeight: FontWeight.bold,
                                    color:Colors.blueGrey),
                              ),
                              Container(
                                height: 10,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                widget.base,
                                style: TextStyle(
                                  fontSize: 10.0, color: Colors.white,
                                ),
                              ),
                            ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 100,
                                  child: TextFormField(
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    controller: usdtController,
                                    autocorrect: true,

                                    validator: (text) {
                                      if (text.trim().length < 1)
                                        return "price Should not be blank.";
                                      // usdt = usdtController.text;
                                      return null;
                                    },
                                    onSaved: (text) => usdt = text,
                                    onChanged: (val){
                                      setState(() {
                                        usdt = usdtController.text;
                                        btc = btcController.text;
                                        var sum = double.parse(usdt) * double.parse(btc);
                                        if(widget.base == iNR){
                                          result1 = sum;
                                          result = result1.round().toString();
                                          print(sum.toString());
                                        }else{
                                          result = sum.toString();
                                        }
                                      });
                                    },
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                        new TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold),
                                        hintText: "",
                                        labelStyle:
                                        new TextStyle(color: Colors.white),
                                        fillColor: Colors.white70),
                                  )),

                              Container(

                                child: Row(
                                  children: <Widget>[

                                    Container(
                                        padding:EdgeInsets.only(right: 5),
                                        child: Text('HIGHEST PRICE',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.red
                                        ),)
                                    ),
                                    Container(
                                      height:35,
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      margin: EdgeInsets.only(right: 5),
                                      child: IconButton(icon: new Icon(Icons.remove,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount1--);
                                        // var bt = _itemCount/10;
                                        /* usdtController.text = _itemCount.toString();
                                          usdt = usdtController.text;
                                          btc = btcController.text;*/
                                      }),
                                    ),
                                    Container(
                                      height:35,
                                      margin: EdgeInsets.only(left: 5),
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      child: IconButton(icon: new Icon(Icons.add,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount1++);
                                        // var bt = _itemCount/10;
                                        /*  usdtController.text = _itemCount.toString() + usd;
                                          usdt = usdtController.text;*/
                                      }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                      /*decoration:
                            myBoxDecoration(), *///       <--- BoxDecoration here
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "AMOUNT",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.blueGrey),
                                ),
                                Container(
                                  height: 10,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  widget.tread,
                                  style: TextStyle(
                                    fontSize: 10.0, color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(

                                  //width: MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.number,
                                      minLines: 1,
                                      maxLines: 5,
                                      controller: btcController,
                                      validator: (text) {
                                        if(text.isEmpty){
                                          return "Please enter amount";}
                                        var n = int.tryParse(text);
                                        if(n == 0) {
                                          return "Please Enter valid amount";
                                        }
                                        // btc = btcController.text;

                                        return null;

                                      },
                                      onSaved: (text) => btc = text,
                                      onChanged: (val){
                                        setState(() {
                                          usdt = usdtController.text;
                                          btc = btcController.text;
                                          var sum = double.parse(usdt) * double.parse(btc);
                                          if(widget.base == iNR){
                                            result1 = sum;
                                            result = result1.round().toString();
                                            print(sum.toString());
                                          }else{
                                            result = sum.toString();
                                          }

                                        });

                                      },
                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                          new TextStyle(color: Colors.white),
                                          hintText: "0",
                                          labelStyle:
                                          new TextStyle(color: Colors.white),
                                          fillColor: Colors.white70),
                                    )),
                              ),
                              /*SizedBox(
                                width: 25,
                              ),*/
                              Container(

                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:35,
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      margin: EdgeInsets.only(right: 5),
                                      child: IconButton(icon: new Icon(Icons.remove,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount--);
                                        // var bt = _itemCount/10;
                                        btcController.text = _itemCount.toString();
                                        usdt = usdtController.text;
                                        btc = btcController.text;
                                        var sum = double.parse(usdt) * double.parse(btc);
                                        if(widget.base == iNR){
                                          result1 = sum;
                                          result = result1.round().toString();
                                          print(sum.toString());
                                        }else{
                                          result = sum.toString();
                                        }
                                      }),
                                    ),
                                    Container(
                                      height:35,
                                      margin: EdgeInsets.only(left: 5),
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      child: IconButton(icon: new Icon(Icons.add,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount++);
                                        // var bt = _itemCount/10;
                                        btcController.text = _itemCount.toString();
                                        usdt = usdtController.text;
                                        btc = btcController.text;
                                        var sum = double.parse(usdt) * double.parse(btc);
                                        if(widget.base == iNR){
                                          result1 = sum;
                                          result = result1.round().toString();
                                          print(sum.toString());
                                        }else{
                                          result = sum.toString();
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 8),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                      /*decoration:
                            myBoxDecoration(), *///       <--- BoxDecoration here
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "TOTAL",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.blueGrey),
                                ),
                                Container(
                                  height: 10,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  widget.base,
                                  style: TextStyle(
                                    fontSize: 10.0, color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  result,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),

                                ),),
                              Container(

                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:35,
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      margin: EdgeInsets.only(right: 5),
                                      child: IconButton(icon: new Icon(Icons.remove,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount--);
                                        // var bt = _itemCount/10;
                                        btcController.text = _itemCount.toString();
                                        usdt = usdtController.text;
                                        btc = btcController.text;
                                        var sum = double.parse(usdt) * double.parse(btc);
                                        if(widget.base == iNR){
                                          result1 = sum;
                                          result = result1.round().toString();
                                          print(sum.toString());
                                        }else{
                                          result = sum.toString();
                                        }
                                      }),
                                    ),
                                    Container(
                                      height:35,
                                      margin: EdgeInsets.only(left: 5),
                                      // color: Color(0xFF18222C),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF18222C),
                                      ),
                                      child: IconButton(icon: new Icon(Icons.add,color: Colors.blueGrey,size: 18,),onPressed: (){
                                        setState(()=>_itemCount++);
                                        // var bt = _itemCount/10;
                                        btcController.text = _itemCount.toString();
                                        usdt = usdtController.text;
                                        btc = btcController.text;
                                        var sum = double.parse(usdt) * double.parse(btc);
                                        if(widget.base == iNR){
                                          result1 = sum;
                                          result = result1.round().toString();
                                          print(sum.toString());
                                        }else{
                                          result = sum.toString();
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ButtonTheme(
                        minWidth: 280.0,
                        padding: EdgeInsets.all(12),
                        child:_isLoading
                            ?CircularProgressIndicator(
                          strokeWidth: 6.0,
                          backgroundColor: Colors.green,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)
                        ):
                        MaterialButton(
                          color: Colors.red,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              setState(() => _isLoading = true);
                              base = widget.base;
                              tread = widget.tread;
                              num = double.parse(usdtController.text);
                              num1 = double.parse(btcController.text);
                              value = num.toString();
                              value1 = num1.toString();
                              int pointIndex = value.indexOf(".");
                              int btcpointIndex = value1.indexOf(".");
                              String afterDecimal = value.substring(pointIndex+1);
                              String btcafterDecimal = value1.substring(btcpointIndex+1);
                              int finalLen = afterDecimal.length;
                              int btcfinalLen = btcafterDecimal.length;
                              print(finalLen);
                              String a = '0';
                              String b = '00';
                              String c = '000';
                              if(finalLen == 1){
                                usdtValue= '$value$c';
                                print("answerc"+usdtValue);
                              }else if(finalLen>1 && finalLen<3) {
                                usdtValue= '$value$b';
                                print("answerb"+usdtValue);
                              }else if(finalLen>2 && finalLen<4){
                                usdtValue= '$value$a';
                                print("answera"+usdtValue);
                              }else if(finalLen>4){
                                usdtValue= num.toStringAsFixed(4);;
                                print("answeraaaaa"+usdtValue);
                              }else {
                                usdtValue = value.substring(0,pointIndex)+value.substring(pointIndex,pointIndex+5);
                                print("answer "+usdtValue);
                              }
                              print("lalit "+ usdtValue);
                              if(btcfinalLen == 1){
                                btcValue= '$value1$c';
                              }else if(btcfinalLen>1 && btcfinalLen<3) {
                                btcValue= '$value1$b';
                              }else if(btcfinalLen>2 && btcfinalLen<4){
                                btcValue= '$value1$a';
                              }else if(btcfinalLen>4){
                                btcValue= num1.toStringAsFixed(4);
                              }else {
                                btcValue = value1.substring(0,btcpointIndex)+value1.substring(btcpointIndex,btcpointIndex+5);
                              }
                              print("btc"+btcValue);
                              /* if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();*/

                              var rsp = await postSell(base, tread, btcValue,usdtValue, context);
                              var data = rsp['data'];
                              var error = rsp['error'];
                              var message = rsp['message'];
                              if (error == "true"){
                                Fluttertoast.showToast(
                                    msg: message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() => _isLoading = false);
                              }else{
                                Fluttertoast.showToast(
                                    msg: message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() => _isLoading = false);
                                setState(() {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MainScreenPage()),
                                  );
                                });
                              }

                              /* PostBusinessInfo.createAlbum(
                                    base, tread, btcValue,usdtValue, context);*/
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          height: 20,
                          child: Text(
                            "PLACE SELL ORDER",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Maker fee: 0.1% | Taker fee: 0.1%',style: TextStyle(
                          color: Colors.white
                      ),),
                    )
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

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
  );
}
