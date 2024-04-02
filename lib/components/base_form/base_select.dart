// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_option.dart';

class BaseSelect extends StatelessWidget {
  final String? placeholder;
  bool? disabled;
  dynamic value;
  List<BaseOption> options;

  BaseSelect(
      {super.key,
      this.placeholder,
      this.disabled,
      this.value,
      required this.options});

  @override
  Widget build(BuildContext context) {
    bool isDisabled = disabled ?? false;
    return GestureDetector(
      onTap: () {
        if (isDisabled) {
          return;
        }
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              placeholder ?? '',
              style: TextStyle(
                  color: isDisabled
                      ? Colors.grey
                      : Theme.of(context).inputDecorationTheme.hintStyle?.color,
                  fontSize: 16),
            )),
            Icon(
              Icons.keyboard_arrow_right,
              color: isDisabled ? Colors.grey : null,
            )
          ],
        ),
      ),
    );
  }
}
