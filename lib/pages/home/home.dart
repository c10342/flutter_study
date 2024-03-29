import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_swiper.dart';
import 'package:flutter_haokezu/pages/home/components/index_navigator.dart';
import 'package:flutter_haokezu/pages/home/components/index_recommend.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('顶部'),
        // 背景颜色：从 App 上下文中获取主题，使用主题中配置的颜色方案中的主要颜色
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: const [BaseSwiper(), IndexNavigator(), IndexRecommend()],
      ),
    );
  }
}
