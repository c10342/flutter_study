import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_search_bar.dart';
import 'package:flutter_haokezu/pages/home/components/info_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<InfoItem> list = [];

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future getList() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List<InfoItem> data = [];
    for (int i = 0; i < 3; i++) {
      data.add(InfoItem(
          title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
          imageUrl:
              'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
          source: "新华网",
          time: "两天前"));
    }
    refreshController.loadNoData();
    setState(() {
      list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      pageBgColor: Colors.grey[200],
      header: const BaseSearchBar(),
      body: BaseListViewBuilder(
          onRefresh: () async {
            await getList();
            refreshController.refreshCompleted();
          },
          onLoading: () {
            refreshController.loadComplete();
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
