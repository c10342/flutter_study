// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/pages/home/search/drawer.dart';
import 'package:flutter_haokezu/utils/widget_utils/index.dart';

class Item extends StatelessWidget {
  final String title;
  final void Function() onTap;
  bool isActive;
  Item(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    Color color =
        isActive ? Theme.of(context).colorScheme.primary : Colors.black;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: color),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: color,
          )
        ],
      ),
    );
  }
}

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  int? _selectArea;
  List<int> _selectType = [];
  List<int> _selectConfig = [];
  List<int> _selectRoomType = [];

  GlobalKey globalKey = GlobalKey();

  OverlayEntry? overlayEntry;

  bool canPop = true;

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    setState(() {
      canPop = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        removeOverlay();
      },
      child: Container(
        key: globalKey,
        height: 40,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Item(
                title: '区域',
                onTap: () {
                  removeOverlay();
                  WidgetUtils.singlePicker<BaseSelectOption, int>(
                    context,
                    [
                      BaseSelectOption(label: '北京', value: 1),
                      BaseSelectOption(label: '上海', value: 2),
                      BaseSelectOption(label: '成都', value: 3),
                      BaseSelectOption(label: '深圳', value: 4),
                      BaseSelectOption(label: '广州', value: 5),
                      BaseSelectOption(label: '杭州', value: 6),
                      BaseSelectOption(label: '重庆', value: 7),
                    ],
                    value: _selectArea,
                    onConfirm: (value) {
                      setState(() {
                        _selectArea = value;
                      });
                    },
                  );
                },
                isActive: _selectArea != null),
            Item(
                title: '方式',
                onTap: () {
                  removeOverlay();
                  WidgetUtils.multiplePicker(
                    context,
                    [
                      BaseSelectOption(label: '北京', value: 1, disabled: true),
                      BaseSelectOption(label: '上海', value: 2),
                      BaseSelectOption(label: '成都', value: 3),
                      BaseSelectOption(label: '深圳', value: 4),
                      BaseSelectOption(label: '广州', value: 5),
                      BaseSelectOption(label: '杭州', value: 6),
                      BaseSelectOption(label: '重庆', value: 7),
                      BaseSelectOption(label: '江门', value: 7),
                      BaseSelectOption(label: '茂名', value: 7),
                      BaseSelectOption(label: '湛江', value: 7),
                    ],
                    value: _selectType,
                    onConfirm: (value) {
                      setState(() {
                        _selectType = value;
                      });
                    },
                  );
                },
                isActive: _selectType.isNotEmpty),
            Item(
                title: '租金',
                onTap: () {
                  if (overlayEntry != null) {
                    removeOverlay();
                    return;
                  }
                  RenderBox renderbox =
                      globalKey.currentContext!.findRenderObject() as RenderBox;
                  Offset topLeft = renderbox.localToGlobal(Offset.zero);
                  Offset bottomLeft =
                      topLeft.translate(0, renderbox.size.height);
                  double height =
                      MediaQuery.of(context).size.height - bottomLeft.dy;
                  //创建一个OverlayEntry对象
                  overlayEntry = OverlayEntry(builder: (context) {
                    //外层使用Positioned进行定位，控制在Overlay中的位置
                    return Positioned(
                        top: bottomLeft.dy,
                        // bottom: 0,
                        left: 0,
                        right: 0,
                        // width: MediaQuery.of(context).size.width,
                        height: height,
                        child: GestureDetector(
                          onTap: () {
                            removeOverlay();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.7)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    height: height * 0.7,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  });
                  //往Overlay中插入插入OverlayEntry
                  Overlay.of(context).insert(overlayEntry!);
                  setState(() {
                    canPop = false;
                  });
                  //两秒后，移除Toast
                  // Future.delayed(Duration(seconds: 2)).then((value) {
                  //   overlayEntry.remove();
                  // });
                },
                isActive: false),
            Item(
                title: '筛选',
                onTap: () {
                  removeOverlay();
                  WidgetUtils.showDrawer(
                    context,
                    content: DrawerPage(
                      selectRoomType: _selectRoomType,
                      selectConfig: _selectConfig,
                      onConfigChange: (value) {
                        setState(() {
                          _selectConfig = value;
                        });
                      },
                      onRoomTypeChange: (value) {
                        setState(() {
                          _selectRoomType = value;
                        });
                      },
                    ),
                  );
                },
                isActive:
                    _selectRoomType.isNotEmpty || _selectConfig.isNotEmpty),
          ],
        ),
      ),
    );
  }
}
