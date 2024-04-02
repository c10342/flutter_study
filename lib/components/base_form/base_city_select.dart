import 'package:flutter/material.dart';

class BaseCitySelect extends StatelessWidget {
  final String? placeholder;

  const BaseCitySelect({super.key, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('search');
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              placeholder ?? '',
              style: TextStyle(
                  color:
                      Theme.of(context).inputDecorationTheme.hintStyle?.color,
                  fontSize: 16),
            )),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
