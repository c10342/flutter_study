# 打包

flutter build apk --dart-define-from-file=env/uat.json --no-tree-shake-icons

# 问题

```
This application cannot tree shake icons fonts. It has non-constant instances of IconData at the following locations:
  - file:///E:/project/flutter_haokezu/lib/components/base_icon.dart:11:7
Target aot_android_asset_bundle failed: Error: Avoid non-constant invocations of IconData or try to build again with --no-tree-shake-icons.
```

这个错误通常出现在使用Flutter进行打包（release build）时，尤其是当你使用了字体图标（如FontAwesome或Material Icons），并且你的代码中有一些不能被树枝化（tree shake）的依赖。"This application cannot tree shake icons fonts. It has non-constant" 意味着你的应用程序不能移除未使用的图标字体，因为它依赖于非常量的东西。