import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_icon.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';
import 'package:flutter_haokezu/components/base_swiper.dart';
import 'package:flutter_haokezu/components/base_tag.dart';
import 'package:flutter_haokezu/pages/room_detail/footer.dart';
import 'package:flutter_haokezu/widgets/info_title_list.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

String roomText =
    'flutter 宽度占满父容器在Flutter中，若要使一个子Widget的宽度占满其父容器，可以使用Expanded或SizedBox.expand。以下是两种实现方式的示例代码：使用Expanded：在这两个示例中，父容器是一个Container设置了固定的height，子Container通过Expanded或SizedBox.expand使其宽度自动填满父容器的剩余空间。flutter 宽度占满父容器在Flutter中，若要使一个子Widget的宽度占满其父容器，可以使用Expanded或SizedBox.expand。以下是两种实现方式的示例代码：使用Expanded：在这两个示例中，父容器是一个Container设置了固定的height，子Container通过Expanded或SizedBox.expand使其宽度自动填满父容器的剩余空间。';

class _RoomDetailPageState extends State<RoomDetailPage> {
  bool _showMore = false;
  bool _showMoreButton = false;

  Widget buildConfigItem(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: Text(text),
    );
  }

  @override
  void initState() {
    super.initState();
    if (roomText.length > 100) {
      _showMoreButton = true;
    }
  }

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
          Container(
            padding: const EdgeInsets.only(bottom: 100),
            child: BaseListView(children: [
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
              BaseGroupTitle(
                title: '房屋信息',
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        buildConfigItem(context, '面积: 100平米'),
                        buildConfigItem(context, '楼层: 高楼层'),
                        buildConfigItem(context, '方型: 三室'),
                        buildConfigItem(context, '装修: 精装'),
                      ],
                    ),
                  )
                ],
              ),
              BaseGroupTitle(
                title: '房屋配置',
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        Column(
                          children: [
                            BaseIcon(
                              codePoint: 0xe908,
                            ),
                            Text(
                              '电视',
                            )
                          ],
                        ),
                        Column(
                          children: [
                            BaseIcon(
                              codePoint: 0xe917,
                            ),
                            Text(
                              '洗衣机',
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              BaseGroupTitle(
                title: '房屋概况',
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roomText,
                          maxLines: _showMore ? null : 5,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                                visible: _showMoreButton,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showMore = !_showMore;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(_showMore ? '收起' : '展开'),
                                      Icon(_showMore
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                )),
                            const Text('举报')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const BaseGroupTitle(
                title: '猜你喜欢',
                children: [
                  InfoTitleList(),
                ],
              )
            ]),
          ),
          const Footer()
        ],
      ),
    );
  }
}
