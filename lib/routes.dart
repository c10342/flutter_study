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
import 'package:flutter_haokezu/utils/helper.dart';

String handleName(String name,
    {Map<String, String>? params, Map<String, dynamic>? query}) {
  params?.keys.forEach((key) {
    RegExp reg = RegExp(":${key}");
    name = name.replaceFirstMapped(reg, (match) => params[key]!);
  });

  Uri uri = Uri(
    path: name,
    queryParameters: query,
  );
  return uri.toString();
}

class Routes {
  // 1、定义路由名称
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static Future<T?>? pushName<T extends Object?>(String name,
      {BuildContext? context,
      Map<String, String>? params,
      Map<String, dynamic>? query}) {
    BuildContext? ctx = context ?? CommonUtils.navigatorKey.currentContext;
    if (ctx == null) {
      return null;
    }

    return Navigator.of(ctx)
        .pushNamed(handleName(name, params: params, query: query));
  }

  static void pop({BuildContext? context}) {
    BuildContext? ctx = context ?? CommonUtils.navigatorKey.currentContext;
    if (ctx == null) {
      return;
    }
    return Navigator.of(ctx).pop();
  }

  static Future<T?>? replace<T extends Object?>(String name,
      {BuildContext? context,
      Map<String, String>? params,
      Map<String, dynamic>? query}) {
    BuildContext? ctx = context ?? CommonUtils.navigatorKey.currentContext;
    if (ctx == null) {
      return null;
    }
    return Navigator.of(ctx)
        .pushReplacementNamed(handleName(name, params: params, query: query));
  }

  static Future<T?>? clearAndPush<T extends Object?>(String name,
      {BuildContext? context,
      Map<String, String>? params,
      Map<String, dynamic>? query}) {
    BuildContext? ctx = context ?? CommonUtils.navigatorKey.currentContext;
    if (ctx == null) {
      return null;
    }
    return Navigator.of(ctx).pushNamedAndRemoveUntil(
        handleName(name, params: params, query: query), (route) => false);
  }

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
    // return RoomDetailPage(
    //   roomId: params['roomId']![0],
    // );
    return const RoomDetailPage(
      roomId: '1',
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
