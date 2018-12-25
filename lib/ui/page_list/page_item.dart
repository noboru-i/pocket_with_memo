import 'package:flutter/material.dart';
import 'package:pocket_with_memo/services/pocket/models/item.dart';

class PageItemView extends StatelessWidget {
  PageItemView(this.item);

  final Item item;

  @override
  Widget build(BuildContext context) {
    String imageUrl = item.image != null ? item.image.src : item.topImageUrl;
    return Card(
      child: InkWell(
        onTap: () => {
              // TODO send tap event to parent.
            },
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                    )
                  : Container(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        item.title,
                        style: Theme.of(context).textTheme.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    item.excerpt.length == 0
                        ? Container()
                        : Text(
                            item.excerpt,
                            style: Theme.of(context).textTheme.overline,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
