import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const PageContent(title: '首页');
  }
}
