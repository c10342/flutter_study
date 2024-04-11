import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';
import 'package:flutter_haokezu/components/base_tag.dart';
import 'package:flutter_haokezu/routes.dart';

class RoomCardItem {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<String> tags;
  final int price;

  RoomCardItem(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      required this.tags,
      required this.price});
}

class RoomCard extends StatelessWidget {
  final RoomCardItem item;
  const RoomCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.pushName(Routes.roomDetail, params: {"roomId": "1"});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        height: 120,
        child: Row(
          children: [
            BaseImage(src: item.imageUrl, width: 132, height: 100),
            const Padding(padding: EdgeInsets.all(10)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  item.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children: item.tags.map((e) => BaseTag(e)).toList(),
                ),
                Text(
                  '${item.price} 元/月',
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
