import 'package:flutter/material.dart';
import 'package:pocket_with_memo/ui/auth_setting/auth_setting.dart';
import 'package:pocket_with_memo/ui/home/home.dart';
import 'package:pocket_with_memo/ui/my_web_view/my_web_view.dart';
import 'package:pocket_with_memo/ui/page_list/page_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket with Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const HomeView(),
        '/list': (_) => PageListView(),
        '/webview': (_) => MyWebView(
              url: "https://www.google.com",
            ),
        '/auth_setting': (_) => AuthSettingView(),
      },
    );
  }
}
