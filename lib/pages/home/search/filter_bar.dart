// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_checkbox.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
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

  Widget buildGroup(String title, List<BaseSelectOption> options,
      {Function(List<int> value)? onChanged, List<int>? value}) {
    return BaseGroupTitle(
      padding: const EdgeInsets.all(5),
      title: title,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: BaseCheckbox(
            options: options,
            builder: (context, option, isSelected, disabled) {
              Color colors = isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black;
              return Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(border: Border.all(color: colors)),
                child: Text(
                  option.label,
                  style: TextStyle(color: colors),
                ),
              );
            },
            value: value,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }

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
          Item(title: '租金', onTap: () {}, isActive: false),
          Item(
              title: '筛选',
              onTap: () {
                WidgetUtils.showDrawer(
                  context,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildGroup('房屋类型', [
                          BaseSelectOption(label: '单间', value: 0),
                          BaseSelectOption(
                            label: '一房一厅',
                            value: 1,
                          ),
                          BaseSelectOption(
                            label: '两房一厅',
                            value: 2,
                          ),
                          BaseSelectOption(label: '三房一厅', value: 3),
                        ], onChanged: (value) {
                          setState(() {
                            _selectRoomType = value;
                          });
                        }, value: _selectRoomType),
                        buildGroup('房屋配置', [
                          BaseSelectOption(label: '电视', value: 0),
                          BaseSelectOption(
                            label: '洗衣机',
                            value: 1,
                          ),
                          BaseSelectOption(
                            label: '空调',
                            value: 2,
                          ),
                          BaseSelectOption(label: '电风扇', value: 3),
                          BaseSelectOption(
                            label: '投影仪',
                            value: 4,
                          ),
                          BaseSelectOption(
                            label: '热水器',
                            value: 5,
                          ),
                        ], onChanged: (value) {
                          setState(() {
                            _selectConfig = value;
                          });
                        }, value: _selectConfig),
                      ],
                    );
                  },
                );
              },
              isActive: _selectRoomType.isNotEmpty || _selectConfig.isNotEmpty),
        ],
      ),
    );
  }
}
