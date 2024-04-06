import 'package:flutter_haokezu/pages/home/helper/provider.dart';

class UpdateController {
  List<UpdateCallback> callbacks = [];

  update(int activeIndex, ActiveType type) {
    List<UpdateCallback> cbs = [...callbacks];
    for (var cb in cbs) {
      cb(activeIndex, type);
    }
  }

  add(UpdateCallback cb) {
    callbacks.add(cb);
  }

  remove(UpdateCallback cb) {
    callbacks.remove(cb);
  }

  dispose() {
    callbacks = [];
  }
}
