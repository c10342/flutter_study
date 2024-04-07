import 'package:flutter/material.dart';

class SystemState extends ChangeNotifier {
  String _lang = 'zh-cn';

  String get lang => _lang;

  void setLang(String value) {
    _lang = value;
    notifyListeners();
  }
}
