// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_haokezu/components/base_image.dart';
import 'package:image_picker/image_picker.dart';

class BaseImagePicker extends StatefulWidget {
  List<String>? value;
  bool? disabled;
  void Function(List<String> value)? onChange;

  BaseImagePicker({super.key, this.value, this.onChange, this.disabled});

  @override
  State<BaseImagePicker> createState() => _BaseImagePickerState();
}

class _BaseImagePickerState extends State<BaseImagePicker> {
  List<String> _value = [];

  List<String> get _realValue => widget.value ?? _value;

  bool get _isDisabled => widget.disabled ?? false;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? [];
  }

  void updateValue(List<String> files) {
    if (widget.onChange != null) {
      widget.onChange!(files);
    } else {
      setState(() {
        _value = files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ..._realValue.asMap().keys.map((index) {
          String imageUrl = _realValue[index];
          return Stack(
            children: [
              BaseImage(
                src: imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
              if (!_isDisabled)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      List<String> files = [..._realValue];
                      files.removeAt(index);
                      updateValue(files);
                    },
                    child: const Icon(Icons.close),
                  ),
                )
            ],
          );
        }).toList(),
        if (!_isDisabled)
          InkWell(
            onTap: () async {
              // 需要添加权限 <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
              final ImagePicker picker = ImagePicker();
              final List<XFile> response = await picker.pickMultiImage();
              List<String> files = [
                ..._realValue,
                ...response.map((e) => e.path).toList()
              ];
              updateValue(files);
            },
            child: Container(
              height: 80,
              width: 120,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
