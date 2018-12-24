import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  MyWebView({this.url});

  final String url;

  @override
  _MyWebView createState() => _MyWebView();
}

class _MyWebView extends State<MyWebView> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  bool _editorVisible = true;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            initialUrl: widget.url,
            javaScriptMode: JavaScriptMode.unrestricted,
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 100.0,
            bottom: 0.0,
            child: ScaleTransition(
              scale: animation,
              alignment: Alignment.topLeft,
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
          ),
          Positioned(
            top: 0.0,
            right: 100.0,
            child: Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _editorVisible = !_editorVisible;
                    if (_editorVisible) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  });
                },
                child: Text('toggle'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
