import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

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
        '/webview': (_) => MyWebView(
              url: "https://www.google.com",
            ),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/webview");
          },
          child: Text('push to webview'),
        ),
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  MyWebView({this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("WebView"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebView(
            initialUrl: url,
            javaScriptMode: JavaScriptMode.unrestricted,
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 100.0,
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
