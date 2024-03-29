import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';
import 'package:flutter_haokezu/routes.dart';

class NavigatorItem {
  final String title;
  final String image;
  final void Function(BuildContext context) onClick;

  NavigatorItem(
      {required this.title, required this.image, required this.onClick});
}

List<NavigatorItem> items = [
  NavigatorItem(
      title: '整租',
      image: 'static/images/home_index_navigator_total.png',
      onClick: (BuildContext context) {
        Navigator.pushNamed(context, Routes.login);
      }),
  NavigatorItem(
      title: '合租',
      image: 'static/images/home_index_navigator_share.png',
      onClick: (BuildContext context) {
        Navigator.pushNamed(context, Routes.login);
      }),
  NavigatorItem(
      title: '地图找房',
      image: 'static/images/home_index_navigator_map.png',
      onClick: (BuildContext context) {
        Navigator.pushNamed(context, Routes.login);
      }),
  NavigatorItem(
      title: '去出租',
      image: 'static/images/home_index_navigator_rent.png',
      onClick: (BuildContext context) {
        Navigator.pushNamed(context, Routes.login);
      }),
];

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map((item) => InkWell(
                    onTap: () {
                      item.onClick(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Column(children: [
                        BaseImage(
                          src: item.image,
                          width: 47.5,
                        ),
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ]),
                    ),
                  ))
              .toList()),
    );
  }
}
