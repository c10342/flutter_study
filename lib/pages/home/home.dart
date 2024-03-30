import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_search_bar.dart';
import 'package:flutter_haokezu/components/base_swiper.dart';
import 'package:flutter_haokezu/pages/home/components/index_info.dart';
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
    return BasePageLayout(
      pageBgColor: Colors.grey[100],
      header: BaseSearchBar(
        onClick: () {
          Navigator.of(context).pushNamed('search');
        },
        left: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.room,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Text(
                '北京',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      headerBgColor: Colors.white,
      body: ListView(
        children: const [
          BaseSwiper(),
          IndexNavigator(),
          IndexRecommend(),
          IndexInfo(),
          Padding(padding: EdgeInsets.all(5))
        ],
      ),
    );
  }
}
