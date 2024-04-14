import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_haokezu/generated/l10n.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/state/system.dart';
import 'package:flutter_haokezu/state/user.dart';
import 'package:flutter_haokezu/utils/helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserState>(create: (context) => UserState()),
      ChangeNotifierProvider<SystemState>(create: (context) => SystemState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    LanguageEnum lang = context.watch<SystemState>().lang;
    return MaterialApp(
      navigatorKey: CommonUtils.navigatorKey,
      title: '好租客',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [Routes.routeObserver],
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
      onGenerateRoute: (settings) {
        // 路由拦截
        // if ('/roomDetail/1' == settings.name) {
        //   settings =
        //       RouteSettings(arguments: settings.arguments, name: Routes.login);
        // }
        return router.generator(settings);
      },
      builder: EasyLoading.init(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale.fromSubtags(
          languageCode: lang == LanguageEnum.en ? 'en' : 'zh',
          countryCode: lang == LanguageEnum.zhTW ? 'TW' : null),
    );
  }
}
