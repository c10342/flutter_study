import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/utils/helper.dart';
import 'package:url_launcher/url_launcher.dart';

class FunctionItem {
  final String imageUrl;
  final String title;
  final Function(BuildContext context)? onTap;
  FunctionItem(
      {required this.imageUrl, required this.title, required this.onTap});
}

final List<FunctionItem> list = [
  FunctionItem(
      imageUrl: 'static/images/home_profile_record.png',
      title: "腾讯会议",
      onTap: (context) async {
        // wemeet://page/inmeeting?meeting_code=你的会议号
        final Uri url = Uri.parse('wemeet://page/inmeeting?meeting_code=你的会议号');
        canLaunchUrl(url);
        if (!await launchUrl(url)) {
          CommonUtils.log('Could not launch $url');
        }
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_order.png',
      title: 'AlertDialog',
      onTap: (context) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('警告'),
                content: const Text('确定删除吗？'),
                actions: [
                  TextButton(onPressed: () {}, child: const Text('确定')),
                  TextButton(onPressed: () {}, child: const Text('取消'))
                ],
              );
            });
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_favor.png',
      title: 'SimpleDialog',
      onTap: (context) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('选择语言'),
                children: [
                  SimpleDialogOption(
                    onPressed: () {},
                    child: const Text('中文'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {},
                    child: const Text('英文'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {},
                    child: const Text('繁体'),
                  )
                ],
              );
            });
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_id.png',
      title: 'showModalBottomSheet',
      onTap: (context) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text('显示在底部的弹框'),
            );
          },
          // 底部弹出框是否支持下滑隐藏
          enableDrag: true,
        );
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_message.png',
      title: 'CupertinoActionSheet',
      onTap: (context) {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: const Text("选择操作"),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    // 处理操作1
                  },
                  child: const Text("操作1"),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    // 处理操作2
                  },
                  child: const Text("操作2"),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("取消"),
              ),
            );
          },
        );
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_contract.png',
      title: 'CupertinoPicker',
      onTap: (context) {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              decoration: const BoxDecoration(color: Colors.white),
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (int index) {
                  // 处理选中项的改变
                },
                children: const [
                  Text("选项1"),
                  Text("选项2"),
                  Text("选项3"),
                ],
              ),
            );
          },
        );
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_wallet.png',
      title: 'Dialog',
      onTap: (context) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("自定义对话框示例"),
                    const SizedBox(height: 10),
                    const Text("这是自定义的内容。"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("关闭"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
  FunctionItem(
      imageUrl: 'static/images/home_profile_house.png',
      title: "房屋管理",
      onTap: (context) {
        Routes.pushName(Routes.roomManage);
      })
];

class MyFunction extends StatelessWidget {
  const MyFunction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: Wrap(
          // 水平间距
          spacing: 10,
          // 垂直间距
          runSpacing: 10,
          children: list
              .map((item) => GestureDetector(
                    onTap: () {
                      if (item.onTap != null) {
                        item.onTap!(context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseImage(
                            src: item.imageUrl,
                            width: 40,
                            // height: 60,
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          Text(item.title)
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
