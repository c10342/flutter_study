import 'package:flutter/material.dart';

TextStyle buttonTextStyle = const TextStyle(color: Colors.white, fontSize: 16);

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isLike = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        height: 100,
        // width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    _isLike = !_isLike;
                  });
                },
                child: Container(
                  height: 50,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        _isLike ? Icons.star : Icons.star_border,
                        color: _isLike
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black,
                      ),
                      Text(
                        _isLike ? '已收藏' : '收藏',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('联系房东', style: buttonTextStyle),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('预约看房', style: buttonTextStyle),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
