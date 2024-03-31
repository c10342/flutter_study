import 'package:flutter/material.dart';
import 'package:flutter_haokezu/routes.dart';

TextStyle textStyle = const TextStyle(
    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  bool isLogin = true;
  Widget noLoginView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(left: 20),
          child: const CircleAvatar(
            backgroundImage: AssetImage('static/images/home_profile_user.png'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Text('登录', style: textStyle),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: Text('/', style: textStyle),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: Text('注册', style: textStyle),
                ),
              ],
            ),
            const Text(
              '登录后可以体验更多',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget loginView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(left: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('已登录用户名', style: textStyle),
            const Text(
              '查看编辑个人资料',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: isLogin ? loginView() : noLoginView(),
    );
  }
}
