import 'package:pocket_with_memo/models/image.dart';

class Item {
  const Item(
    this.itemId,
    this.title,
    this.image,
  );

  final int itemId;
  final String title;

//  private int resolvedId;
//  private String givenUrl;
//  private String resolvedUrl;
//  private String givenTitle;
//  private String resolvedTitle;
//  private int favorite;
//  private int status;
//  private String excerpt;
//  private int isArticle;
//  private int hasImage;
//  private int hasVideo;
//  private int wordCount;
//  private int sortId;
//  private Set<String> tags;
  final Image image;

  // TODO delete after fetching data from API.
  static Item createDummy(int seed) {
    List<String> dummyImages = [
      "https://my-android-server.appspot.com/image/screen568x568.jpeg",
      "https://my-android-server.appspot.com/image/screen568x568_2.jpeg",
      "https://my-android-server.appspot.com/image/device-2011-07-30-235110.png"
    ];
    return Item(
      seed,
      "sample" + seed.toString(),
      Image(
        seed,
        dummyImages[seed],
      ),
    );
  }
}
