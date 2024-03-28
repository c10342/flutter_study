import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_input.dart';
import 'package:flutter_haokezu/components/page_content.dart';
import 'package:flutter_haokezu/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return PageContent(
      title: '登录',
      // 苹果安全区域
      child: SafeArea(
          minimum: const EdgeInsets.all(30),
          // ListView解决垂直高度不够，键盘弹起的时候
          child: ListView(
            children: [
              BaseInput(label: '用户名', placeholder: '请输入用户名'),
              const Padding(padding: EdgeInsets.all(10)),
              BaseInput(
                label: '密码',
                placeholder: '请输入密码',
                password: !showPassword,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    //todo
                  },
                  child: const Text('登录')),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('还没有账号，'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.register);
                      },
                      child: const Text('去注册'))
                ],
              )
            ],
          )),
    );
  }
}
