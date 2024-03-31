import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyUtils {
  static Future<void> loading({String message = 'loading'}) {
    return EasyLoading.show(
        status: message,
        // 用户不可点击
        maskType: EasyLoadingMaskType.clear);
  }

  static Future<void> close() {
    return EasyLoading.dismiss();
  }

  static Future<void> toast(String message) {
    return EasyLoading.showToast(message);
  }
}
