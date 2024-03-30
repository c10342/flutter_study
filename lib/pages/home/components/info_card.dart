import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;

  InfoItem(
      {required this.title,
      required this.imageUrl,
      required this.source,
      required this.time});
}

class InfoCard extends StatelessWidget {
  final InfoItem item;
  const InfoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: BaseImage(
              src: item.imageUrl,
              width: 120,
              height: 84,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                maxLines: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.source,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  Text(item.time)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
