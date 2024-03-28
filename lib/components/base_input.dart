import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  String? label;
  String? placeholder;
  bool? password;
  BaseInput({super.key, this.password, this.label, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // 密码输入
      obscureText: password ?? false,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
      ),
    );
  }
}
