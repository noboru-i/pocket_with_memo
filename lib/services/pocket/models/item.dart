import 'package:pocket_with_memo/services/pocket/models/image.dart';

class Item {
  const Item({
    this.itemId,
    this.resolvedId,
    this.givenUrl,
    this.resolvedUrl,
    this.givenTitle,
    this.resolvedTitle,
    this.favorite,
    this.status,
    this.excerpt,
    this.isArticle,
    this.hasImage,
    this.hasVideo,
    this.wordCount,
    this.sortId,
    // this.tags,
    this.image,
  });

  final int itemId;
  final int resolvedId;
  final String givenUrl;
  final String resolvedUrl;
  final String givenTitle;
  final String resolvedTitle;
  final int favorite;
  final int status;
  final String excerpt;
  final int isArticle;
  final int hasImage;
  final int hasVideo;
  final int wordCount;
  final int sortId;
//  private Set<String> tags;
  final Image image;

  String get title {
    // TODO given or resolved
    return givenTitle;
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> images = json['images'] ?? {};
    final Image image = images['1'] == null ? null : Image.fromJson(images['1']);
    print(json);
    return Item(
      itemId: int.parse(json['item_id']),
      resolvedId: int.parse(json['resolved_id']),
      givenUrl: json['given_url'],
      resolvedUrl: json['resolved_url'],
      givenTitle: json['given_title'],
      resolvedTitle: json['resolved_title'],
      favorite: int.parse(json['favorite']),
      status: int.parse(json['status']),
      excerpt: json['excerpt'],
      isArticle: int.parse(json['is_article']),
      hasImage: int.parse(json['has_image']),
      hasVideo: int.parse(json['has_video']),
      wordCount: int.parse(json['word_count']),
      sortId: json['sort_id'],
      image: image,
    );
  }
}
