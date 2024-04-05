import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/select_picker/select_list.dart';

class SelectPicker {
  static showBottomSheet<T extends BaseSelectOption>(
      BuildContext context, List<T> options,
      {Function(dynamic value)? onConfirm, dynamic value}) {
    return showModalBottomSheet(
      // shape: const BeveledRectangleBorder(
      //     // 取消圆角
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(0), topRight: Radius.circular(0))),
      context: context,
      builder: (context) {
        return SelectList(
          options: options,
          value: value,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onConfirm: (value) {
            if (onConfirm != null) {
              onConfirm(value);
            }
            Navigator.of(context).pop();
          },
        );
      },
      // 底部弹出框是否支持下滑隐藏
      enableDrag: true,
      // 点击非底部弹出框的区域时，是否需要自动隐藏底部弹出框
      // isDismissible: false,
      // 遮罩层的颜色
      // barrierColor: Colors.green.withAlpha(0x66),
    );
  }
}
