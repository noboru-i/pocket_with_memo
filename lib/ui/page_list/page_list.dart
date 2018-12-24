import 'package:flutter/material.dart';
import 'package:pocket_with_memo/models/item.dart';
import 'package:pocket_with_memo/ui/page_list/page_item.dart';

class PageListView extends StatefulWidget {
  @override
  _PageListView createState() => _PageListView();
}

class _PageListView extends State<PageListView> {
  List<Item> items;

  @override
  void initState() {
    // TODO dummy data.
    items = [
      Item.createDummy(0),
      Item.createDummy(1),
      Item.createDummy(2),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int length = items?.length ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: new Text("Page List"),
      ),
      body: new ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          if (length < index) {
            return null;
          }
          return PageItemView(items[index]);
        },
      ),
    );
  }
}
