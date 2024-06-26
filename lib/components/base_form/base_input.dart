import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseInput extends StatefulWidget {
  String? label;
  String? placeholder;
  bool? password;
  bool? autofocus;
  InputBorder? border;
  String? value;
  void Function(String value)? onChanged;
  bool? disabled;
  int? minLines;
  int? maxLines;
  BaseInput(
      {super.key,
      this.password,
      this.label,
      this.placeholder,
      this.border,
      this.onChanged,
      this.autofocus,
      this.value,
      this.disabled,
      this.minLines,
      this.maxLines});

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: widget.minLines,
      // obscureText为true时，maxLines只能为1或者不设置该参数，否则会报错
      maxLines: widget.minLines != null &&
              widget.maxLines == null &&
              widget.password != true
          ? (widget.minLines! + 5)
          : 1,
      enabled: widget.disabled == true ? false : true,
      controller: _controller,
      // 密码输入
      obscureText: widget.password ?? false,
      decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.placeholder,
          border: widget.border),
      onChanged: widget.onChanged,
      autofocus: widget.autofocus ?? false,
    );
  }
}
