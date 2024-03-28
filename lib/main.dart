import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: router.generator,
    );
  }
}
