import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          Positioned(
            top: 0.0,
            right: 100.0,
            child: Container(
              child: RaisedButton(
                onPressed: () {},
                child: Text('toggle'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
