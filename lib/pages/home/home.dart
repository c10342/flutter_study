// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_search_bar.dart';
import 'package:flutter_haokezu/components/base_swiper.dart';
import 'package:flutter_haokezu/pages/home/components/index_navigator.dart';
import 'package:flutter_haokezu/pages/home/components/index_recommend.dart';
import 'package:flutter_haokezu/pages/home/helper/controller.dart';
import 'package:flutter_haokezu/widgets/info_title_list.dart';

class HomeView extends StatefulWidget {
  int activeIndex;
  int index;
  UpdateController? updateController;
  HomeView(
      {super.key,
      required this.activeIndex,
      required this.index,
      this.updateController});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      body: BaseListView(
        children: const [
          BaseSwiper(
            images: [
              'https://img2.baidu.com/it/u=1028011339,1319212411&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313',
              'https://img1.baidu.com/it/u=2205810988,4283060315&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
              'https://pic.rmb.bdstatic.com/bjh/914b8c0f9814b14c5fedeec7ec6615df5813.jpeg'
            ],
          ),
          IndexNavigator(),
          IndexRecommend(),
          InfoTitleList(
            title: '最新资讯',
          ),
          Padding(padding: EdgeInsets.all(5))
        ],
      ),
    );
  }
}
