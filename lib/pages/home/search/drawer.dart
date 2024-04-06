// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_checkbox.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';

class DrawerPage extends StatefulWidget {
  final void Function(List<int> value)? onConfigChange;
  final void Function(List<int> value)? onRoomTypeChange;
  List<int>? selectConfig;
  List<int>? selectRoomType;
  DrawerPage(
      {super.key,
      this.onConfigChange,
      this.onRoomTypeChange,
      this.selectConfig,
      this.selectRoomType});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  List<int> _selectConfig = [];
  List<int> _selectRoomType = [];

  @override
  void initState() {
    super.initState();
    _selectConfig = widget.selectConfig ?? [];
    _selectRoomType = widget.selectRoomType ?? [];
  }

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
          if (widget.onRoomTypeChange != null) {
            widget.onRoomTypeChange!(value);
          }
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
          if (widget.onConfigChange != null) {
            widget.onConfigChange!(value);
          }
          setState(() {
            _selectConfig = value;
          });
        }, value: _selectConfig),
      ],
    );
  }
}
