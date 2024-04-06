import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/pages/home/components/my_advertisement.dart';
import 'package:flutter_haokezu/pages/home/components/my_function.dart';
import 'package:flutter_haokezu/pages/home/components/my_info.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/widgets/info_title_list.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePageLayout(
      title: '我的',
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.setting);
            },
            icon: const Icon(
              Icons.settings,
            ))
      ],
      body: BaseListView(
        children: const [
          MyInfo(),
          MyFunction(),
          MyAdvertisement(),
          InfoTitleList(
            title: '最新资讯',
          ),
        ],
      ),
    );
  }
}
