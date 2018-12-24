import 'package:flutter/material.dart';

class PageListView extends StatefulWidget {
  @override
  _PageListView createState() => _PageListView();
}

class _PageListView extends State<PageListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Page List"),
      ),
      body: Text("test"),
    );
  }
}
