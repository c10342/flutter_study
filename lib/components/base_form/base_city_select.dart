// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BaseCitySelect extends StatelessWidget {
  final String? placeholder;
  bool? disabled;
  dynamic value;

  BaseCitySelect({super.key, this.placeholder, this.disabled, this.value});

  @override
  Widget build(BuildContext context) {
    bool isDisabled = disabled ?? false;
    return GestureDetector(
        // 点击空白触发点击事件
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (isDisabled) {
            return;
          }
          Navigator.of(context).pushNamed('search');
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
                        : Theme.of(context)
                            .inputDecorationTheme
                            .hintStyle
                            ?.color,
                    fontSize: 16),
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: isDisabled ? Colors.grey : null,
              )
            ],
          ),
        ));
  }
}
