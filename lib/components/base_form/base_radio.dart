// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/helper.dart';

class BaseRadio<T extends BaseSelectOption> extends StatefulWidget {
  final List<T> options;
  dynamic value;
  bool? disabled;
  final void Function(dynamic value)? onChanged;

  BaseRadio(
      {super.key,
      required this.options,
      this.value,
      this.onChanged,
      this.disabled});

  @override
  State<BaseRadio> createState() => _BaseRadioState<T>();
}

class _BaseRadioState<T extends BaseSelectOption> extends State<BaseRadio<T>> {
  dynamic _value;

  dynamic get realValue => widget.value ?? _value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _value = widget.value;
    }
  }

  void _onChanged(dynamic value) {
    T? option = CommonUtils.findItemByList(
        widget.options, (element) => element.value == value);
    if (option?.disabled == true || widget.disabled == true) {
      return;
    }
    if (realValue == value) {
      return;
    }
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    if (widget.value == null) {
      setState(() {
        _value = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.options.map((item) {
        bool isDisabled = (item.disabled ?? widget.disabled) ?? false;
        Color? color;
        if (isDisabled) {
          color = Colors.grey;
        } else if (realValue == item.value) {
          color = Theme.of(context).colorScheme.primary;
        }
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _onChanged(item.value);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Radio(
                    // 禁用颜色，或者onChanged给null
                    fillColor: isDisabled
                        ? MaterialStateColor.resolveWith((states) {
                            return Colors.grey;
                          })
                        : null,
                    value: item.value,
                    groupValue: widget.value ?? _value,
                    onChanged: _onChanged),
                Text(
                  item.label,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
