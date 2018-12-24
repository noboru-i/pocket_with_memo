import 'package:flutter/material.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';
import 'package:pocket_with_memo/services/pocket/pocket_client.dart';
import 'package:pocket_with_memo/ui/page_list/page_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageListView extends StatefulWidget {
  @override
  _PageListView createState() => _PageListView();
}

class _PageListView extends State<PageListView> {
  List<Item> items;

  @override
  void initState() {
    items = [];
    super.initState();

    fetchList().then((List<Item> items) => setItems(items));
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

  Future<List<Item>> fetchList() async {
    print("fetchList");
    final prefs = await SharedPreferences.getInstance();
    return await PocketClient().fetchItems(prefs.getString("pocket_access_token"));
  }

  void setItems(List<Item> items) {
    setState(() {
      this.items = items;
    });
  }
}
