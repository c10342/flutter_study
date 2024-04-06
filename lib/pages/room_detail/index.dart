import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';
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
          BaseListView(children: const [
            BaseGroupTitle(title: '整租 历史最低'),
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
