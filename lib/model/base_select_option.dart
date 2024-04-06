class BaseSelectOption<T> {
  final String label;
  final T value;
  final bool? disabled;

  BaseSelectOption({required this.label, required this.value, this.disabled});
}
