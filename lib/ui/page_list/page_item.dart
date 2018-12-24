import 'package:flutter/material.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';

class PageItemView extends StatelessWidget {
  PageItemView(this.item);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 120,
            // TODO how to show blank?
            child: item.image == null ? Text("") : Image.network(
              item.image.src,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title),
              Text("body"),
            ],
          )
        ],
      ),
    );
  }
}
