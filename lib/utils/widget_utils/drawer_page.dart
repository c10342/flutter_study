import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final double? width;
  final Widget? Function(BuildContext context)? builder;
  final bool? isDismissible;
  const DrawerPage({super.key, this.width, this.builder, this.isDismissible});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isDismissible == true) {
          return;
        }
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.7)),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                width: widget.width ?? MediaQuery.of(context).size.width * 0.7,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: widget.builder != null
                        ? widget.builder!(context)
                        : null,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
