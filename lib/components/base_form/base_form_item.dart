import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/provider.dart';

class BaseFormItem extends StatelessWidget {
  final String? label;
  final double? labelWidth;
  final Widget? suffix;
  final Widget? content;
  final String? suffixText;

  const BaseFormItem(
      {super.key,
      this.label,
      this.suffix,
      this.content,
      this.suffixText,
      this.labelWidth});

  @override
  Widget build(BuildContext context) {
    FormProvider? formProvider = FormProvider.of(context);
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black))),
      child: Row(
        children: [
          if (label != null && label != '')
            SizedBox(
              width: labelWidth ?? formProvider?.labelWidth,
              child: Text(
                label!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          if (content != null) Expanded(child: content!),
          if (suffixText != null)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(suffixText!),
            ),
          if (suffix != null)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: suffix!,
            ),
        ],
      ),
    );
  }
}
