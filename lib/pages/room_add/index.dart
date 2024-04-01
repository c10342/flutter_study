import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  @override
  Widget build(BuildContext context) {
    return const BasePageLayout(
      title: '发布房源',
    );
  }
}
