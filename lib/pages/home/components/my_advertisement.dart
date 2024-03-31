import 'package:flutter/cupertino.dart';
import 'package:flutter_haokezu/components/base_image.dart';

class MyAdvertisement extends StatelessWidget {
  const MyAdvertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: BaseImage(
          src:
              'https://img.zcool.cn/community/0141e55a4b7ff7a801206ed33c952f.png@2o.png'),
    );
  }
}
