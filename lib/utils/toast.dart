import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseToast {
  static Future<bool?> show(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
