import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'network_status_service.dart';

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;

  const NetworkAwareWidget({Key key, this.onlineChild, this.offlineChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    if (networkStatus == NetworkStatus.Online) {
      return onlineChild;
    } else {
     // _showToastMessage('Not internet connection');
      return offlineChild;
    }
  }

  void _showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1
    );
  }
}