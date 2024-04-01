import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/pages/home/index.dart';
import 'package:flutter_haokezu/pages/login.dart';
import 'package:flutter_haokezu/pages/not_found.dart';
import 'package:flutter_haokezu/pages/register.dart';
import 'package:flutter_haokezu/pages/room_add/index.dart';
import 'package:flutter_haokezu/pages/room_detail/index.dart';
import 'package:flutter_haokezu/pages/room_manage/index.dart';
import 'package:flutter_haokezu/pages/setting.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Routes {
  // 1、定义路由名称
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';

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

  static final Handler _roomManageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const RoomManagePage();
  });

  static final Handler _roomAddHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const RoomAddPage();
  });

  // 3、初始化路由
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(register, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}

abstract class RouteLifeState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
