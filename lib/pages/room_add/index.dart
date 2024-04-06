import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_checkbox.dart';
import 'package:flutter_haokezu/components/base_form/base_city_select.dart';
import 'package:flutter_haokezu/components/base_form/base_form.dart';
import 'package:flutter_haokezu/components/base_form/base_form_item.dart';
import 'package:flutter_haokezu/components/base_form/base_image_picker.dart';
import 'package:flutter_haokezu/components/base_form/base_input.dart';
import 'package:flutter_haokezu/components/base_form/base_radio.dart';
import 'package:flutter_haokezu/components/base_form/base_select.dart';
import 'package:flutter_haokezu/components/base_icon.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/model/base_select_option.dart';
import 'package:flutter_haokezu/components/base_group_title.dart';

class CheckboxOptions extends BaseSelectOption {
  int codePoint;

  CheckboxOptions(
      {required super.label,
      required super.value,
      required this.codePoint,
      super.disabled});
}

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
        title: '发布房源',
        body: BaseListView(
          children: [
            BaseForm(labelWidth: 100, children: [
              BaseGroupTitle(
                title: '房源信息',
                children: [
                  BaseFormItem(
                    label: '小区',
                    content: BaseCitySelect(
                      placeholder: '请选择小区',
                      // disabled: true,
                    ),
                  ),
                  BaseFormItem(
                    label: '租金',
                    content: BaseInput(
                      border: InputBorder.none,
                      placeholder: '请输入租金信息',
                      autofocus: false,
                      disabled: true,
                    ),
                    suffixText: '元/月',
                  ),
                  BaseFormItem(
                    label: '大小',
                    content: BaseInput(
                      border: InputBorder.none,
                      placeholder: '请输入房屋大小',
                      autofocus: false,
                    ),
                    suffixText: '平方米',
                  ),
                  BaseFormItem(
                    label: '租赁方式',
                    content: BaseRadio(
                      options: [
                        BaseSelectOption(label: '合租', value: 0, disabled: true),
                        BaseSelectOption(
                          label: '整租',
                          value: 1,
                        ),
                        BaseSelectOption(
                          label: '单间',
                          value: 2,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '装修',
                    content: BaseRadio(
                      disabled: true,
                      options: [
                        BaseSelectOption(
                          label: '精装',
                          value: 0,
                        ),
                        BaseSelectOption(
                          label: '简装',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '户型',
                    content: BaseSelect(
                      placeholder: '请选择',
                      options: [
                        BaseSelectOption(
                          label: '一室',
                          value: 0,
                        ),
                        BaseSelectOption(
                          label: '二室',
                          disabled: true,
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '楼层',
                    content: BaseSelect(
                      placeholder: '请选择',
                      options: [
                        BaseSelectOption(
                          label: '高楼层',
                          value: 0,
                        ),
                        BaseSelectOption(
                          label: '低楼层',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '朝向',
                    content: BaseSelect(
                      placeholder: '请选择',
                      disabled: true,
                      options: [
                        BaseSelectOption(
                          label: '东',
                          value: 0,
                        ),
                        BaseSelectOption(
                          label: '西',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BaseGroupTitle(
                title: '房屋图像',
                children: [BaseImagePicker()],
              ),
              BaseGroupTitle(
                title: '房屋标题',
                children: [
                  BaseFormItem(
                    content: BaseInput(
                      border: InputBorder.none,
                      placeholder: '请输入房屋标题',
                      autofocus: false,
                    ),
                  ),
                ],
              ),
              BaseGroupTitle(
                title: '房屋配置',
                children: [
                  BaseFormItem(
                    content: BaseCheckbox(
                      options: [
                        BaseSelectOption(label: '苹果', value: 0, disabled: true),
                        BaseSelectOption(
                          label: '雪梨',
                          value: 1,
                        ),
                        BaseSelectOption(
                          label: '香蕉',
                          value: 2,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    content: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: BaseCheckbox(
                        options: [
                          CheckboxOptions(
                              label: '电视',
                              value: 0,
                              disabled: true,
                              codePoint: 0xe908),
                          CheckboxOptions(
                              label: '洗衣机', value: 1, codePoint: 0xe917),
                          CheckboxOptions(
                              label: '空调', value: 2, codePoint: 0xe90d),
                        ],
                        builder: (context, option, isSelected, disabled) {
                          bool isDisabled =
                              (option.disabled ?? disabled) ?? false;
                          Color? color;
                          if (isDisabled) {
                            color = Colors.grey;
                          } else if (isSelected) {
                            color = Theme.of(context).colorScheme.primary;
                          }

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BaseIcon(
                                codePoint: option.codePoint,
                                color: color,
                              ),
                              Text(
                                option.label,
                                style: TextStyle(color: color),
                              ),
                              AbsorbPointer(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Checkbox(
                                      value: isSelected,
                                      onChanged:
                                          isDisabled ? null : (value) {}),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              BaseGroupTitle(
                title: '房屋描述',
                children: [
                  BaseFormItem(
                    content: BaseInput(
                      minLines: 4,
                      border: InputBorder.none,
                      placeholder: '请输入房屋描述',
                      autofocus: false,
                    ),
                  ),
                ],
              )
            ])
          ],
        ));
  }
}
