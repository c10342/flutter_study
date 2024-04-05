// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/helper.dart';
import 'package:flutter_haokezu/utils/select_picker/index.dart';

class BaseSelect<T extends BaseSelectOption> extends StatefulWidget {
  final String? placeholder;
  bool? disabled;
  dynamic value;
  List<T> options;
  Function(dynamic value)? onChange;

  BaseSelect(
      {super.key,
      this.placeholder,
      this.disabled,
      this.value,
      required this.options,
      this.onChange});

  @override
  State<BaseSelect> createState() => _BaseSelectState<T>();
}

class _BaseSelectState<T extends BaseSelectOption>
    extends State<BaseSelect<T>> {
  dynamic _value;

  dynamic get _realValue => widget.value ?? _value;

  dynamic get _disabled => widget.disabled ?? false;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _value = widget.value;
    }
  }

  Widget buildLabel() {
    if (_realValue == null) {
      // 值不存在，显示占位符
      return Text(
        widget.placeholder ?? '',
        style: TextStyle(
            color: _disabled
                ? Colors.grey
                : Theme.of(context).inputDecorationTheme.hintStyle?.color,
            fontSize: 16),
      );
    }
    T? option = CommonUtils.findItemByList(
        widget.options, (element) => element.value == _realValue);

    return Text(
      option?.label ?? _realValue,
      style: TextStyle(
          color: _disabled ? Colors.grey : Colors.black, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (_disabled) {
          return;
        }
        SelectPicker.showBottomSheet(
          context,
          widget.options,
          value: _realValue,
          onConfirm: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            } else {
              setState(() {
                _value = value;
              });
            }
          },
        );
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buildLabel()),
            Icon(
              Icons.keyboard_arrow_right,
              color: _disabled ? Colors.grey : null,
            )
          ],
        ),
      ),
    );
  }
}
