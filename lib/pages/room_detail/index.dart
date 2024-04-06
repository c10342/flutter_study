import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';
import 'package:flutter_haokezu/components/base_swiper.dart';
import 'package:flutter_haokezu/components/base_tag.dart';
import 'package:flutter_haokezu/pages/room_detail/footer.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      title: '房屋详情',
      actions: [
        GestureDetector(
          child: const Icon(Icons.share),
        )
      ],
      body: Stack(
        children: [
          BaseListView(children: [
            const BaseSwiper(
              images: [
                'https://img2.baidu.com/it/u=1028011339,1319212411&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313',
                'https://img1.baidu.com/it/u=2205810988,4283060315&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
                'https://pic.rmb.bdstatic.com/bjh/914b8c0f9814b14c5fedeec7ec6615df5813.jpeg'
              ],
            ),
            BaseGroupTitle(
              title: '整租 历史最低',
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    children: [
                      Text(
                        '3000',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                      ),
                      Text('元/月(押一付二)',
                          style: TextStyle(fontSize: 16, color: Colors.pink))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    children: [BaseTag('近地铁'), BaseTag('集中供暖')],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  // 缩进
                  // indent: 10,
                  // endIndent: 10,
                )
              ],
            ),
            BaseGroupTitle(title: '房屋配置'),
            BaseGroupTitle(title: '房屋概况'),
            BaseGroupTitle(title: '猜你喜欢'),
          ]),
          const Footer()
        ],
      ),
    );
  }
}
