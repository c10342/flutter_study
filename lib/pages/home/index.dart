import 'package:flutter/material.dart';
import 'package:flutter_haokezu/pages/home/home.dart';
import 'package:flutter_haokezu/pages/home/info.dart';
import 'package:flutter_haokezu/pages/home/my.dart';
import 'package:flutter_haokezu/pages/home/search.dart';

List<Widget> tabViews = [
  const HomeView(),
  const SearchView(),
  const InfoView(),
  const MyView(),
];

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

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  void onTabItemClick(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViews[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabItems,
        currentIndex: selectIndex,
        onTap: onTabItemClick,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
