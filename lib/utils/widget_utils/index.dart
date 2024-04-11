import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/routes.dart';
import 'package:flutter_haokezu/utils/widget_utils/multiple_select_list.dart';
import 'package:flutter_haokezu/utils/widget_utils/single_select_list.dart';

class WidgetUtils {
  static Future<void> showLoading({String message = 'loading'}) {
    return EasyLoading.show(
        status: message,
        // 用户不可点击
        maskType: EasyLoadingMaskType.clear);
  }

  static Future<void> closeLoading() {
    return EasyLoading.dismiss();
  }

  static Future<void> showToast(String message) {
    return EasyLoading.showToast(message);
  }

// 底部弹框
  static Future showBottomSheet(
      BuildContext context, Widget Function(BuildContext) builder) {
    return showModalBottomSheet(
      // shape: const BeveledRectangleBorder(
      //     // 取消圆角
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(0), topRight: Radius.circular(0))),
      context: context,
      builder: builder,
      // 底部弹出框是否支持下滑隐藏
      enableDrag: true,
      // 点击非底部弹出框的区域时，是否需要自动隐藏底部弹出框
      // isDismissible: false,
      // 遮罩层的颜色
      // barrierColor: Colors.green.withAlpha(0x66),
    );
  }

// 单选弹框
  static Future singlePicker<T extends BaseSelectOption, V>(
      BuildContext context, List<T> options,
      {void Function(V value)? onConfirm, V? value}) {
    return showBottomSheet(context, (ctx) {
      return SingleSelectList(
        options: options,
        value: value,
        onCancel: () {
          Routes.pop();
        },
        onConfirm: (value) {
          if (onConfirm != null) {
            onConfirm(value);
          }
          Routes.pop();
        },
      );
    });
  }

// 多选弹框
  static Future multiplePicker<T extends BaseSelectOption, V extends dynamic>(
      BuildContext context, List<T> options,
      {void Function(List<V> value)? onConfirm, List<V>? value}) {
    return showBottomSheet(context, (ctx) {
      return MultipleSelectList(
        options: options,
        value: value,
        onCancel: () {
          Routes.pop();
        },
        onConfirm: (value) {
          if (onConfirm != null) {
            onConfirm(value);
          }
          Routes.pop();
        },
      );
    });
  }

  static showDrawer(BuildContext context,
      {double? width, required Widget content, bool? isDismissible}) {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                width: width ?? MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: content,
                ),
              )
            ],
          );
        });
  }
}
