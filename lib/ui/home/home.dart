import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/auth_setting");
              },
              child: Text('push to auth setting'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/list");
              },
              child: Text('push to list'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/webview");
              },
              child: Text('push to webview'),
            ),
          ],
        ),
      ),
    );
  }
}
