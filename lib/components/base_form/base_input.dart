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
  BaseInput(
      {super.key,
      this.password,
      this.label,
      this.placeholder,
      this.border,
      this.onChanged,
      this.autofocus,
      this.value,
      this.disabled});

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
