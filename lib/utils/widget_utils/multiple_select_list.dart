// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/helper.dart';

class MultipleSelectList<T extends BaseSelectOption, V> extends StatefulWidget {
  List<T> options;
  Function()? onCancel;
  Function(List<V> value)? onConfirm;
  List<V>? value;
  MultipleSelectList(
      {super.key,
      required this.options,
      this.onCancel,
      this.onConfirm,
      this.value});

  @override
  State<MultipleSelectList> createState() => _MultipleSelectListState<T, V>();
}

class _MultipleSelectListState<T extends BaseSelectOption, V>
    extends State<MultipleSelectList<T, V>> {
  List<V> _value = [];

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? [];
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
              onPressed: () {
                if (widget.onConfirm != null) {
                  widget.onConfirm!([..._value]);
                }
              },
              child: const Text('确定'),
            )
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            T item = widget.options[index];
            return CheckboxListTile(
              enabled: item.disabled != true,
              value: CommonUtils.findItemByList(
                      _value, (element) => element == item.value) !=
                  null,
              title: Text(item.label),
              onChanged: (value) {
                List<V> val = [..._value];
                if (value == true) {
                  val.add(item.value);
                } else {
                  int index =
                      val.indexWhere((element) => element == item.value);
                  val.removeAt(index);
                }
                setState(() {
                  _value = val;
                });
              },
            );
          },
          itemCount: widget.options.length,
          physics: const ClampingScrollPhysics(),
        ))
      ],
    );
  }
}
