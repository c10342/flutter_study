import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';

class RecommendItem {
  final String title;
  final String subTitle;
  final String imageUrl;

  RecommendItem(
      {required this.title, required this.subTitle, required this.imageUrl});
}

List<RecommendItem> items = [
  RecommendItem(
      title: '家住回龙观',
      subTitle: '归属的感觉',
      imageUrl: 'static/images/home_index_recommend_1.png'),
  RecommendItem(
      title: '宜居四五环',
      subTitle: '大都市生活',
      imageUrl: 'static/images/home_index_recommend_2.png'),
  RecommendItem(
      title: '喧嚣三里屯',
      subTitle: '繁华的背后',
      imageUrl: 'static/images/home_index_recommend_3.png'),
  RecommendItem(
      title: '比邻十号线',
      subTitle: '地铁心连心',
      imageUrl: 'static/images/home_index_recommend_4.png'),
];

class IndexRecommend extends StatefulWidget {
  const IndexRecommend({super.key});

  @override
  State<IndexRecommend> createState() => _IndexRecommendState();
}

TextStyle textStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

class _IndexRecommendState extends State<IndexRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '房屋推荐',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                '更多',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Wrap(
            // item间的间距
            spacing: 10,
            // 换行的之间的间距
            runSpacing: 10,
            children: items
                .map((item) => GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.all(5),
                        height: 100,
                        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.title,
                                  style: textStyle,
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  item.subTitle,
                                  style: textStyle,
                                ),
                              ],
                            ),
                            BaseImage(
                              src: item.imageUrl,
                              width: 55,
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
