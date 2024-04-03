class CommonUtils {
  static T? findItemByList<T>(List<T> list, bool Function(T element) cb) {
    try {
      return list.firstWhere(cb);
    } catch (e) {
      return null;
    }
  }
}
