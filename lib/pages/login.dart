import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_input.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/generated/l10n.dart';
import 'package:flutter_haokezu/model/user_info.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/state/user.dart';
import 'package:flutter_haokezu/utils/widget_utils/index.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  String userName = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    final UserState user = Provider.of<UserState>(context);
    S t = S.of(context);
    return BasePageLayout(
      title: '登录',
      // 苹果安全区域
      body: SafeArea(
          minimum: const EdgeInsets.all(30),
          // ListView解决垂直高度不够，键盘弹起的时候
          child: BaseListView(
            children: [
              BaseInput(
                label: '用户名',
                placeholder: '请输入用户名',
                onChanged: (value) {
                  userName = value;
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              BaseInput(
                label: '密码',
                placeholder: '请输入密码',
                password: !showPassword,
                onChanged: (value) {
                  password = value;
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    if (userName.isEmpty || password.isEmpty) {
                      WidgetUtils.showToast('账号密码不能为空');
                    } else {
                      user.setUserInfo(
                          UserInfo(userName: userName, id: password));
                      user.setToken('token');
                      Routes.pop();
                    }
                  },
                  child: Text(t.login)),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('还没有账号，'),
                  TextButton(
                      onPressed: () {
                        Routes.replace(Routes.register);
                      },
                      child: const Text('去注册'))
                ],
              )
            ],
          )),
    );
  }
}
