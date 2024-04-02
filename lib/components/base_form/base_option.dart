class BaseOption {
  final String label;
  final dynamic value;
  final bool? disabled;

  BaseOption({required this.label, required this.value, this.disabled});
}
