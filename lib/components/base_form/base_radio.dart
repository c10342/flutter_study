// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/select_option.dart';
import 'package:flutter_haokezu/utils/helper.dart';

class BaseRadio extends StatefulWidget {
  final List<SelectOption> options;
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
  State<BaseRadio> createState() => _BaseRadioState();
}

class _BaseRadioState extends State<BaseRadio> {
  dynamic _value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _value = widget.value;
    }
  }

  void _onChanged(dynamic value) {
    SelectOption? option = CommonUtils.findItemByList(
        widget.options, (element) => element.value == value);
    if (option?.disabled == true || widget.disabled == true) {
      return;
    }
    dynamic realValue = widget.value ?? _value;
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
                  style: TextStyle(color: isDisabled ? Colors.grey : null),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
