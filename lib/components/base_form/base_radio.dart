// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_option.dart';

class BaseRadio extends StatefulWidget {
  final List<BaseOption> options;
  dynamic value;
  final void Function(dynamic value)? onChanged;

  BaseRadio({super.key, required this.options, this.value, this.onChanged});

  @override
  State<BaseRadio> createState() => _BaseRadioState();
}

class _BaseRadioState extends State<BaseRadio> {
  dynamic _value;

  void _onChanged(dynamic value) {
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
      children: widget.options
          .map((item) => GestureDetector(
                onTap: () {
                  _onChanged(item.value);
                },
                child: Row(
                  children: [
                    Radio(
                        value: item.value,
                        groupValue: widget.value ?? _value,
                        onChanged: _onChanged),
                    Text(item.label)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
