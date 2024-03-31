import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/pages/home/home.dart';
import 'package:flutter_haokezu/pages/home/info.dart';
import 'package:flutter_haokezu/pages/home/my.dart';
import 'package:flutter_haokezu/pages/home/search.dart';
import 'package:flutter_haokezu/routes.dart';

List<BottomNavigationBarItem> tabItems = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
  const BottomNavigationBarItem(icon: Icon(Icons.info), label: '资讯'),
  const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends RouteLifeState<HomePage> {
  int selectIndex = 0;
  late PageController _pageController;

  @override
  void didPush() {
    print('跳转该页面而显示');
  }

  @override
  void didPop() {
    print('当前页面被pop而隐藏');
  }

  @override
  void didPopNext() {
    print('上一个页面关闭而显示');
  }

  @override
  void didPushNext() {
    print('跳转下一个页面而隐藏');
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: selectIndex);
    super.initState();
  }

  void onTabItemClick(int index) {
    setState(() {
      selectIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      // body: tabViews[selectIndex],
      // 缓存页面-懒加载，配合 AutomaticKeepAliveClientMixin 一起使用
      body: PageView(
        controller: _pageController,
        children: const [
          HomeView(),
          SearchView(),
          InfoView(),
          MyView(),
        ],
      ),
      // 缓存页面，缺点-一次性加载所有页面
      // body: IndexedStack(index: selectIndex, children: tabViews),
      footer: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabItems,
        currentIndex: selectIndex,
        onTap: onTabItemClick,
        selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
