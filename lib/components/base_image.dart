import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

RegExp netWorkUrl = RegExp('^http');
RegExp localUrl = RegExp('^static');

// ignore: must_be_immutable
class BaseImage extends StatelessWidget {
  String src;
  double? width;
  BoxFit? fit;
  BaseImage({super.key, required this.src, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    if (netWorkUrl.hasMatch(src)) {
      return CachedNetworkImage(
        imageUrl: src,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: width,
        fit: fit,
      );
    } else if (localUrl.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        fit: fit,
      );
    }
    // 断言，false，表示失败
    assert(false, '图片地址 src 不合法！');
    return Container();
  }
}
