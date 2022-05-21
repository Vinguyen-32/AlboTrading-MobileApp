class Offer {
  final String name, title;
  final List<String>? images;

  Offer({
    this.name = '',
    this.images = const [],
    this.title = '',
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    json['images'].forEach((item) => images.add(item.toString()));
    return Offer(
      name: json['name'],
      title: json['title'] ?? '',
      images: images,
    );
  }
}
