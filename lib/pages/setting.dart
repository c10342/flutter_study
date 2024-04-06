import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/utils/widget_utils/index.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: '设置',
      body: BaseListView(
        children: [
          ElevatedButton(
              onPressed: () {
                // BaseToast.show('退出登录');
                WidgetUtils.showToast('退出登录');
                // 导航到新的路由并清空整个栈
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.login, (route) => false);
              },
              child: const Text('退出登录')),
        ],
      ),
    );
  }
}
