import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePageLayout(
      title: '404',
      body: Center(
        child: Text('您访问的页面不存在'),
      ),
    );
  }
}
