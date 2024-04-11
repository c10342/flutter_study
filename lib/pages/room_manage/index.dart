import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/pages/room_manage/room_list.dart';
import 'package:flutter_haokezu/routes.dart';

class RoomManagePage extends StatefulWidget {
  const RoomManagePage({super.key});

  @override
  State<RoomManagePage> createState() => _RoomManagePageState();
}

class _RoomManagePageState extends State<RoomManagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: BasePageLayout(
        title: '房屋管理',
        headerBottom: const TabBar(tabs: [
          Tab(
            child: Text(
              '已租',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              '空置',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
        body: const TabBarView(
          children: [
            RoomList(),
            RoomList(),
          ],
        ),
        floatingLocation: FloatingActionButtonLocation.centerFloat,
        floating: GestureDetector(
          onTap: () {
            Routes.pushName(Routes.roomAdd);
          },
          child: Container(
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text(
              '发布',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
