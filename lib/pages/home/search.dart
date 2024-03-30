import 'package:flutter/material.dart';
import 'package:flutter_haokezu/pages/home/components/room_card.dart';

List<RoomCardItem> list = [
  RoomCardItem(
      id: '1',
      title: '朝阳门南大街 2室1厅 8300元，朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      tags: ["近地铁", "集中供暖", "新上", "随时看房"],
      price: 1200),
  RoomCardItem(
      id: '2',
      title: '朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      tags: ["近地铁", "集中供暖", "新上", "随时看房"],
      price: 1200),
  RoomCardItem(
      id: '3',
      title: '朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      tags: ["近地铁", "集中供暖", "新上", "随时看房"],
      price: 1200),
  RoomCardItem(
      id: '4',
      title: '朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUrl:
          'https://ke-image.ljcdn.com/110000-inspection/pc1_c48D9qbWV.jpg.280x210.jpg',
      tags: ["近地铁", "集中供暖", "新上", "随时看房"],
      price: 1200)
];

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('搜索'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: RoomCard(
                item: list[index],
              ),
            );
          },
          itemCount: list.length,
        ));
  }
}
