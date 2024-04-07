import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/user_info.dart';

class UserState extends ChangeNotifier {
  String _token = '';

  String get token => _token;

  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  void setToken(String value) {
    _token = value;
    notifyListeners();
  }

  void setUserInfo(UserInfo? value) {
    _userInfo = value;
    notifyListeners();
  }
}
