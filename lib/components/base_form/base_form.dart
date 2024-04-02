import 'package:flutter/cupertino.dart';
import 'package:flutter_haokezu/components/base_form/provider.dart';

class BaseForm extends StatelessWidget {
  final double? labelWidth;
  final List<Widget> children;

  const BaseForm({super.key, this.labelWidth, required this.children});

  @override
  Widget build(BuildContext context) {
    return FormProvider(
        labelWidth: labelWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ));
  }
}
