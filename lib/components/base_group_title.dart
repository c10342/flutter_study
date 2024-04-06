import 'package:flutter/material.dart';

class BaseGroupTitle extends StatelessWidget {
  final String title;
  final List<Widget>? children;

  const BaseGroupTitle({super.key, required this.title, this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          if (children != null) ...children!,
        ],
      ),
    );
  }
}
