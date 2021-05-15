import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DepositPageState();
  }
}

class DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF18222C),
      ),
      body: Container(
        color: Color(0xFF18222C),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Deposit Money",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  Text(
                    "0.00 INR",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/fz_deposit_deposit.png",
                        width: 65,
                        height: 30,
                      ),
                      Text(
                        "Instant Deposit",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Min 100.00 INR Max 50,00,000 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Min 100.00 INR Max 50,00,000 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Instant Fee : 0.00 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Regular Fee: 10 INR Free for limited time",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/fz_extend_deposit.png",
                        width: 65,
                        height: 30,
                      ),
                      Text(
                        "Extended Deposit",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Min 100.00 INR Max 50,00,000 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Min 100.00 INR Max 50,00,000 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Instant Fee : 0.00 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Regular Fee: 10 INR Free for limited time",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/fz_net_banking.png",
                        width: 65,
                        height: 30,
                      ),
                      Text(
                        "Net Banking",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Min 100.00 INR Max 50,00,000 INR ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Text(
                        "Time< 15 min, Fees : 1.77%",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
