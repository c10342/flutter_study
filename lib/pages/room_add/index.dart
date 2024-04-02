import 'package:flutter/material.dart';
import 'package:flutter_haokezu/components/base_form/base_city_select.dart';
import 'package:flutter_haokezu/components/base_form/base_form.dart';
import 'package:flutter_haokezu/components/base_form/base_form_item.dart';
import 'package:flutter_haokezu/components/base_form/base_input.dart';
import 'package:flutter_haokezu/components/base_form/base_option.dart';
import 'package:flutter_haokezu/components/base_form/base_radio.dart';
import 'package:flutter_haokezu/components/base_list_view.dart';
import 'package:flutter_haokezu/components/base_page_layout.dart';
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
                  const BaseFormItem(
                    label: '小区',
                    content: BaseCitySelect(
                      placeholder: '请选择小区',
                    ),
                  ),
                  BaseFormItem(
                    label: '租金',
                    content: BaseInput(
                      border: InputBorder.none,
                      placeholder: '请输入租金信息',
                      autofocus: false,
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
                        BaseOption(
                          label: '合租',
                          value: 0,
                        ),
                        BaseOption(
                          label: '整租',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                  BaseFormItem(
                    label: '装修',
                    content: BaseRadio(
                      options: [
                        BaseOption(
                          label: '精装',
                          value: 0,
                        ),
                        BaseOption(
                          label: '简装',
                          value: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GroupTitle(
                title: '房屋头像',
              ),
              GroupTitle(
                title: '房屋标题',
              ),
              GroupTitle(
                title: '房屋配置',
              ),
              GroupTitle(
                title: '房屋描述',
              )
            ])
          ],
        ));
  }
}
