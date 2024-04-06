import 'package:flutter/material.dart';
import 'package:flutter_haokezu/pages/home/components/info_card.dart';

class InfoTitleList extends StatefulWidget {
  final String? title;
  const InfoTitleList({super.key, this.title});

  @override
  State<InfoTitleList> createState() => _InfoTitleListState();
}

class _InfoTitleListState extends State<InfoTitleList> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null && widget.title != '')
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.title!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        Column(
          children: list.asMap().keys.map((index) {
            InfoItem item = list[index];
            return Container(
              margin: EdgeInsets.only(
                  top: index == 0 ? 0 : 10, left: 10, right: 10),
              child: InfoCard(item: item),
            );
          }).toList(),
        )
      ],
    );
  }
}
