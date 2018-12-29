import 'package:flutter/material.dart';
import 'package:pocket_with_memo/bloc/articles_provider.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';
import 'package:pocket_with_memo/ui/page_list/page_item.dart';

class PageListView extends StatefulWidget {
  @override
  _PageListView createState() => _PageListView();
}

class _PageListView extends State<PageListView> {

  @override
  void initState() {
    super.initState();

    final articlesBloc = ArticlesProvider.of(context);
    articlesBloc.load.add(0);
  }

  @override
  Widget build(BuildContext context) {
    final articlesBloc = ArticlesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: new Text("Page List"),
      ),
      body: StreamBuilder<List<Item>>(
        stream: articlesBloc.list,
        initialData: [],
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.data.length < index) {
              return null;
            }
            return PageItemView(snapshot.data[index]);
          },
        ),
      ),
    );
  }
}
