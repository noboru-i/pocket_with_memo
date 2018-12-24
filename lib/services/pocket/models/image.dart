class Image {
  const Image({
    this.itemId,
    this.src,
    this.width,
    this.height,
  });

  final int itemId;
  final String src;
  final int width;
  final int height;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      itemId: int.parse(json['item_id']),
      src: json['src'],
      width: int.parse(json['width']),
      height: int.parse(json['height']),
    );
  }
}
