// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseListViewBuilder<T> extends StatelessWidget {
  List<T> list;
  Widget? Function(BuildContext context, T data, int index) itemBuilder;
  void Function() onRefresh;
  void Function() onLoading;
  RefreshController refreshController;

  BaseListViewBuilder(
      {super.key,
      required this.list,
      required this.itemBuilder,
      required this.onRefresh,
      required this.onLoading,
      required this.refreshController});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("上拉刷新");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("加载失败");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("释放加载更多");
          } else {
            body = const Text("全部");
          }
          return SizedBox(height: 55.0, child: Center(child: body));
        },
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: list.isEmpty
          ? const Center(
              child: Text(
                '暂无数据',
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return itemBuilder(context, list[index], index);
              },
              itemCount: list.length,
              physics: const ClampingScrollPhysics()),
    );
  }
}

class BaseListView extends StatelessWidget {
  List<Widget>? children;

  BaseListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // 处理ClampingScrollPhysics下拉或者上拉，元素会放大
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: ListView(
            // physics: const ClampingScrollPhysics(),
            // physics: const BouncingScrollPhysics(),
            children: children!));
  }
}
