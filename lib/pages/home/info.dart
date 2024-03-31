// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_search_bar.dart';
import 'package:flutter_haokezu/pages/home/components/info_card.dart';
import 'package:flutter_haokezu/pages/home/provider.dart';
import 'package:flutter_haokezu/utils/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InfoView extends StatefulWidget {
  int activeIndex;
  int index;
  InfoView({super.key, required this.activeIndex, required this.index});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView>
    with AutomaticKeepAliveClientMixin, UpdateProviderMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<InfoItem> list = [];

  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  void update(int activeIndex, ActiveType type) {
    if (activeIndex == widget.index && type == ActiveType.Show) {
      setState(() {
        list = [];
      });
      refreshController.resetNoData();
      pageIndex = 0;
      getList();
    }
  }

  Future getList({bool showLoading = true}) async {
    if (showLoading == true) {
      EasyUtils.loading();
    }
    await Future.delayed(const Duration(milliseconds: 1000));
    List<InfoItem> data = [];
    var random = Random();
    for (int i = 0; i < 10; i++) {
      int randomNumber = random.nextInt(100);
      data.add(InfoItem(
          title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院--$randomNumber',
          imageUrl:
              'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
          source: "新华网",
          time: "两天前"));
    }
    if (pageIndex == 0) {
      refreshController.refreshCompleted();
    } else if (pageIndex >= 3) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
    setState(() {
      if (pageIndex == 0) {
        list = data;
      } else {
        list.addAll(data);
      }
    });
    EasyUtils.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePageLayout(
      pageBgColor: Colors.grey[200],
      header: const BaseSearchBar(),
      body: BaseListViewBuilder(
          onRefresh: () async {
            refreshController.resetNoData();
            pageIndex = 0;
            await getList(showLoading: false);
          },
          onLoading: () async {
            pageIndex += 1;
            await getList(showLoading: false);
          },
          refreshController: refreshController,
          list: list,
          itemBuilder: (BuildContext context, InfoItem data, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InfoCard(item: data),
            );
          }),
    );
  }
}
