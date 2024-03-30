// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef VoidCallback = void Function();

class BaseListViewBuilder<T> extends StatelessWidget {
  List<T> list;
  Widget? Function(BuildContext context, T data, int index) itemBuilder;
  void Function(VoidCallback success, VoidCallback failed)? onRefresh;
  void Function(Function({bool? noData}) success, VoidCallback failed)?
      onLoading;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  BaseListViewBuilder(
      {super.key,
      required this.list,
      required this.itemBuilder,
      this.onRefresh,
      this.onLoading});

  void _onRefresh() {
    if (onRefresh != null) {
      onRefresh!(() {
        refreshController.refreshCompleted();
      }, () {
        refreshController.refreshFailed();
      });
    }
  }

  void _onLoading() {
    if (onLoading != null) {
      onLoading!(({bool? noData}) {
        if (noData == true) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }, () {
        refreshController.loadFailed();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: onRefresh != null,
      enablePullUp: onLoading != null,
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
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return itemBuilder(context, list[index], index);
          },
          itemCount: list.length,
          physics: const BouncingScrollPhysics()),
    );
  }
}

class BaseListView extends StatelessWidget {
  List<Widget>? children;

  BaseListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
        // physics: const ClampingScrollPhysics(),
        physics: const BouncingScrollPhysics(),
        children: children!);
  }
}
