import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/pages/home/components/info_card.dart';

List<InfoItem> list = [
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      source: "新华网",
      time: "两天前"),
  InfoItem(
      title: '置业选择 | 珠江新城 三室一厅 广州的隔江眺望',
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      source: "新华网",
      time: "两天前"),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      source: "新华网",
      time: "两天前"),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      source: "新华网",
      time: "两天前"),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      source: "新华网",
      time: "两天前")
];

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      backgroundColor: Colors.grey[100],
      title: '资讯',
      // child: ListView.separated(
      //   itemBuilder: (BuildContext context, int index) {
      //     return InfoCard(item: list[index]);
      //   },
      //   //自定义分割线
      //   separatorBuilder: (context, index) {
      //     return Divider(thickness: 2, color: Colors.grey[300]);
      //   },
      //   itemCount: list.length,
      // ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: InfoCard(item: list[index]),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
