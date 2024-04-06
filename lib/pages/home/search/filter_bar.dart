// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/select_picker/index.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                SelectPicker.singlePicker<BaseSelectOption, int>(
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
                SelectPicker.multiplePicker<BaseSelectOption, int>(
                  context,
                  [
                    BaseSelectOption<int>(
                        label: '北京', value: 1, disabled: true),
                    BaseSelectOption<int>(label: '上海', value: 2),
                    BaseSelectOption<int>(label: '成都', value: 3),
                    BaseSelectOption<int>(label: '深圳', value: 4),
                    BaseSelectOption<int>(label: '广州', value: 5),
                    BaseSelectOption<int>(label: '杭州', value: 6),
                    BaseSelectOption<int>(label: '重庆', value: 7),
                    BaseSelectOption<int>(label: '江门', value: 7),
                    BaseSelectOption<int>(label: '茂名', value: 7),
                    BaseSelectOption<int>(label: '湛江', value: 7),
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
          Item(title: '租金', onTap: () {}, isActive: false),
          Item(title: '筛选', onTap: () {}, isActive: false),
        ],
      ),
    );
  }
}
