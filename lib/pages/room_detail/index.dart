import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/page_content.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  @override
  Widget build(BuildContext context) {
    return PageContent(title: 'roomId:${widget.roomId}');
  }
}
