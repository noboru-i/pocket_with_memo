import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web with Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWebView(
          url: "https://www.google.com",
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  MyWebView({this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: url,
      appBar: new AppBar(
        title: new Text("Webview"),
      ),
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
