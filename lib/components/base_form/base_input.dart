import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseInput extends StatelessWidget {
  String? label;
  String? placeholder;
  bool? password;
  bool? autofocus;
  InputBorder? border;
  Function(String value)? onChanged;
  BaseInput(
      {super.key,
      this.password,
      this.label,
      this.placeholder,
      this.border,
      this.onChanged,
      this.autofocus});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // 密码输入
      obscureText: password ?? false,
      decoration: InputDecoration(
          labelText: label, hintText: placeholder, border: border),
      onChanged: onChanged,
      autofocus: autofocus ?? false,
    );
  }
}
