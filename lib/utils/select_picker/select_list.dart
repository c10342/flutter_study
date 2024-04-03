// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/select_option.dart';

class SelectList extends StatefulWidget {
  List<SelectOption> options;
  Function()? onCancel;
  Function(dynamic value)? onConfirm;
  dynamic value;
  SelectList(
      {super.key,
      required this.options,
      this.onCancel,
      this.onConfirm,
      this.value});

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  late FixedExtentScrollController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    int index = 0;
    if (widget.value != null) {
      index =
          widget.options.indexWhere((element) => element.value == widget.value);
      index = index < 0 ? 0 : index;
    }
    _index = index;
    // 滚动到指定值的位置
    _controller = FixedExtentScrollController(initialItem: _index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  if (widget.onCancel != null) {
                    widget.onCancel!();
                  }
                },
                child: const Text('取消')),
            TextButton(
              onPressed: widget.options[_index].disabled == true
                  ? null
                  : () {
                      if (widget.onConfirm != null) {
                        SelectOption item = widget.options[_index];
                        widget.onConfirm!(item.value);
                      }
                    },
              child: const Text('确定'),
            )
          ],
        ),
        Expanded(
            child: CupertinoPicker(
          scrollController: _controller,
          // 每个item的高度
          itemExtent: 50.0,
          onSelectedItemChanged: (index) {
            setState(() {
              _index = index;
            });
          },
          children: widget.options.map((item) {
            return Center(
              child: Text(
                item.label,
                style: TextStyle(
                    fontSize: 16,
                    color: item.disabled == true ? Colors.grey : null),
              ),
            );
          }).toList(),
        ))
      ],
    );
  }
}
