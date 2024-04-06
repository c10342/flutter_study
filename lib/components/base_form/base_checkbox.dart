// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/helper.dart';

class BaseCheckbox<T extends BaseSelectOption, V> extends StatefulWidget {
  final List<T> options;
  List<V>? value;
  bool? disabled;
  Widget Function(
      BuildContext context, T option, bool isSelected, bool? disabled)? builder;
  final void Function(List<V> value)? onChanged;

  BaseCheckbox(
      {super.key,
      this.builder,
      required this.options,
      this.onChanged,
      this.value,
      this.disabled});

  @override
  State<BaseCheckbox> createState() => _BaseCheckboxState<T, V>();
}

class _BaseCheckboxState<T extends BaseSelectOption, V>
    extends State<BaseCheckbox<T, V>> {
  List<V> _value = [];

  // List<V> get _realValue => widget.value ?? _value;
  List<V> get _realValue {
    return widget.value ?? _value;
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? [];
  }

  void _onChange(V value) {
    List<V> val = [..._realValue];
    int index = val.indexWhere((v) => v == value);
    if (index > -1) {
      // 已经存在，要取消
      val.removeAt(index);
    } else {
      val.add(value);
    }
    if (widget.onChanged != null) {
      widget.onChanged!(val);
    } else {
      setState(() {
        _value = val;
      });
    }
  }

  Widget defaultBuilder(BuildContext context, T option, bool isSelected) {
    bool isDisabled = (option.disabled ?? widget.disabled) ?? false;
    Color? color;
    if (isDisabled) {
      color = Colors.grey;
    } else if (isSelected) {
      color = Theme.of(context).colorScheme.primary;
    }
    return Row(
      children: [
        // 用户的点击事件会被AbsorbPointer吸收而不会传递到Checkbox本身
        AbsorbPointer(
          child: SizedBox(
            width: 40,
            height: 40,
            child: Checkbox(
                value: isSelected, onChanged: isDisabled ? null : (value) {}),
          ),
        ),
        Text(
          option.label,
          style: TextStyle(color: color),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: widget.options.map((item) {
          bool isSelected =
              CommonUtils.findItemByList(_realValue, (v) => v == item.value) !=
                  null;
          return GestureDetector(
            onTap: () {
              if (item.disabled == true || widget.disabled == true) {
                return;
              }
              _onChange(item.value);
            },
            behavior: HitTestBehavior.translucent,
            child: widget.builder != null
                ? widget.builder!(context, item, isSelected, widget.disabled)
                : defaultBuilder(context, item, isSelected),
          );
        }).toList());
  }
}
