import 'package:flutter/material.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/utils/select_picker/multiple_select_list.dart';
import 'package:flutter_haokezu/utils/select_picker/single_select_list.dart';

class SelectPicker {
  static singlePicker<T extends BaseSelectOption, V>(
      BuildContext context, List<T> options,
      {void Function(V value)? onConfirm, V? value}) {
    return showModalBottomSheet(
      // shape: const BeveledRectangleBorder(
      //     // 取消圆角
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(0), topRight: Radius.circular(0))),
      context: context,
      builder: (context) {
        return SingleSelectList(
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

  static multiplePicker<T extends BaseSelectOption, V extends dynamic>(
      BuildContext context, List<T> options,
      {void Function(List<V> value)? onConfirm, List<V>? value}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return MultipleSelectList(
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
    );
  }
}
