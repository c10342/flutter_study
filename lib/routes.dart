import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/pages/home/index.dart';
import 'package:flutter_haokezu/pages/login.dart';
import 'package:flutter_haokezu/pages/not_found.dart';
import 'package:flutter_haokezu/pages/register.dart';
import 'package:flutter_haokezu/pages/room_detail/index.dart';
import 'package:flutter_haokezu/pages/setting.dart';

class Routes {
  // 1、定义路由名称
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String setting = '/setting';

  // 2、定义处理函数
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const HomePage();
  });

  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const LoginPage();
  });

  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const NotFound();
  });

  static final Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RoomDetailPage(
      roomId: params['roomId']![0],
    );
  });

  static final Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const RegisterPage();
  });

  static final Handler _settingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const SettingPage();
  });
  // 3、初始化路由
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(register, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
