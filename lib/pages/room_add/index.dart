import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_city_select.dart';
import 'package:flutter_haokezu/components/base_form/base_form.dart';
import 'package:flutter_haokezu/components/base_form/base_form_item.dart';
import 'package:flutter_haokezu/components/base_form/base_image_picker.dart';
import 'package:flutter_haokezu/components/base_form/base_input.dart';
import 'package:flutter_haokezu/components/base_form/base_radio.dart';
import 'package:flutter_haokezu/components/base_form/base_select.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
import 'package:flutter_haokezu/model/select_option.dart';
import 'package:flutter_haokezu/pages/room_add/group_title.dart';

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
              GroupTitle(
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
                        SelectOption(label: '合租', value: 0, disabled: true),
                        SelectOption(
                          label: '整租',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '装修',
                    content: BaseRadio(
                      disabled: true,
                      options: [
                        SelectOption(
                          label: '精装',
                          value: 0,
                        ),
                        SelectOption(
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
                        SelectOption(
                          label: '一室',
                          value: 0,
                        ),
                        SelectOption(
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
                        SelectOption(
                          label: '高楼层',
                          value: 0,
                        ),
                        SelectOption(
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
                        SelectOption(
                          label: '东',
                          value: 0,
                        ),
                        SelectOption(
                          label: '西',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GroupTitle(
                title: '房屋图像',
                children: [BaseImagePicker()],
              ),
              GroupTitle(
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
              GroupTitle(
                title: '房屋配置',
              ),
              GroupTitle(
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
