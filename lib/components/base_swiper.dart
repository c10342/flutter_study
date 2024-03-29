import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_image.dart';

List<String> images = [
  'https://img2.baidu.com/it/u=1028011339,1319212411&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313',
  'https://img1.baidu.com/it/u=2205810988,4283060315&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
  'https://pic.rmb.bdstatic.com/bjh/914b8c0f9814b14c5fedeec7ec6615df5813.jpeg',
];

int itemWidth = 424;
int itemHeight = 750;

class BaseSwiper extends StatefulWidget {
  const BaseSwiper({super.key});

  @override
  State<BaseSwiper> createState() => _BaseSwiperState();
}

class _BaseSwiperState extends State<BaseSwiper> {
  @override
  Widget build(BuildContext context) {
    // 图片宽 750px 高 424px
    double height = MediaQuery.of(context).size.width / itemHeight * itemWidth;
    return SizedBox(
      height: height,
      child: Swiper(
        itemHeight: height,
        itemBuilder: (context, index) {
          final image = images[index];
          // return Image.network(image, fit: BoxFit.fill);
          return BaseImage(
            src: image,
            fit: BoxFit.fill,
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(),
        // control: const SwiperControl(),
      ),
    );
  }
}
