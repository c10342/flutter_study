import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';
import 'package:flutter_haokezu/routes.dart';

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
      title: "看房记录",
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_order.png',
      title: '我的订单',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_favor.png',
      title: '我的收藏',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_id.png',
      title: '身份认证',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_message.png',
      title: '联系我们',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_contract.png',
      title: '电子合同',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_wallet.png',
      title: '钱包',
      onTap: null),
  FunctionItem(
      imageUrl: 'static/images/home_profile_house.png',
      title: "房屋管理",
      onTap: (context) {
        // bool isLogin = true; //假设先设置未登录
        // if (isLogin) {
        //   Navigator.pushNamed(context, 'roomManage');
        // }
        Navigator.of(context).pushNamed(Routes.roomManage);
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
