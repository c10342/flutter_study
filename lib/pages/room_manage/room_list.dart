import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/pages/home/components/room_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RoomList extends StatefulWidget {
  const RoomList({super.key});

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  List<RoomCardItem> list = [];

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      list.add(RoomCardItem(
          id: '4',
          title: '朝阳门南大街 2室1厅 8300元',
          subTitle: "二室/114/东|北/朝阳门南大街",
          imageUrl:
              'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
          tags: ["近地铁", "集中供暖", "新上", "随时看房"],
          price: 1200));
    }
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseListViewBuilder(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          refreshController.loadComplete();
        },
        refreshController: refreshController,
        list: list,
        itemBuilder: (BuildContext context, RoomCardItem data, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: RoomCard(
              item: data,
            ),
          );
        });
  }
}
