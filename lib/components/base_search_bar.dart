import 'package:flutter/material.dart';

class BaseSearchBar extends StatefulWidget {
  final Widget? left;
  final Widget? right;
  final Function? onClick;
  final Function? onSearch;
  final String? defaultValue;
  const BaseSearchBar(
      {super.key,
      this.left,
      this.right,
      this.onClick,
      this.defaultValue,
      this.onSearch});

  @override
  State<BaseSearchBar> createState() => _BaseSearchBarState();
}

class _BaseSearchBarState extends State<BaseSearchBar> {
  String _searchValue = '';
  late TextEditingController _controller;
  late FocusNode _focus;

  void _onClear() {
    _controller.clear();
    setState(() {
      _searchValue = '';
    });
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.defaultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.left != null) widget.left!,
        Expanded(
            child: Container(
          height: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: Colors.grey[200]),
          child: TextField(
            focusNode: _focus,
            controller: _controller,
            onChanged: ((value) {
              setState(() {
                _searchValue = value;
              });
            }),
            onTap: () {
              if (widget.onClick != null) {
                _focus.unfocus();
                widget.onClick!();
              }
            },
            onSubmitted: (value) {
              if (widget.onSearch != null) {
                widget.onSearch!();
              }
            },
            // 键盘变成搜索按钮
            textInputAction: TextInputAction.search,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入搜索词',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                suffixIcon: _searchValue != ''
                    ? GestureDetector(
                        onTap: () {
                          _onClear();
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 18,
                          color: Colors.grey,
                        ),
                      )
                    : null,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.only(top: 0.2)),
          ),
        )),
        if (widget.right != null) widget.right!,
      ],
    );
  }
}
