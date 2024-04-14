import 'package:flutter/material.dart';

enum LanguageEnum { zh, en, zhTW }

class SystemState extends ChangeNotifier {
  LanguageEnum _lang = LanguageEnum.zh;

  LanguageEnum get lang => _lang;

  void changeLang(LanguageEnum value) {
    _lang = value;
    notifyListeners();
  }
}
