import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_haokezu/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    return MaterialApp(
      title: '好租客',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        // 旧版写法
        // primarySwatch: Colors.green,
        // 新版写法
        colorScheme: const ColorScheme.light(
          // 修改亮色主题的主题颜色
          primary: Colors.green,
        ), // 设置AppBar的主题色
      ),
      onGenerateRoute: router.generator,
      builder: EasyLoading.init(),
    );
  }
}
