import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_input.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: '注册',
      // 苹果安全区域
      body: SafeArea(
          minimum: const EdgeInsets.all(30),
          // ListView解决垂直高度不够，键盘弹起的时候
          child: BaseListView(
            children: [
              BaseInput(label: '用户名', placeholder: '请输入用户名'),
              const Padding(padding: EdgeInsets.all(10)),
              BaseInput(label: '密码', placeholder: '请输入密码'),
              const Padding(padding: EdgeInsets.all(10)),
              BaseInput(label: '确认密码', placeholder: '请确认密码'),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    //todo
                  },
                  child: const Text('注册')),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('已有账号，'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: const Text('去登录'))
                ],
              )
            ],
          )),
    );
  }
}
