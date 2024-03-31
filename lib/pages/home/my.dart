import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/pages/home/components/my_info.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: '我的',
      actions: [
        IconButton(
            onPressed: () {
              //todo
            },
            icon: const Icon(
              Icons.settings,
            ))
      ],
      body: BaseListView(
        children: [const MyInfo()],
      ),
    );
  }
}
