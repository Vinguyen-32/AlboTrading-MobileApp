import 'package:timeago/timeago.dart' as timeago;

class Post {
  final String name,
      location,
      caption,
      image,
      time,
      price,
      type,
      id,
      author,
      authorId,
      avatar,
      endAt,
  title,
      durationOption,
      locationOption,
      shippingOption;
  final List<String>? postImages;
  final bool isActive;

  Post({
    this.name = '',
    this.location = '',
    this.caption = '',
    this.image = '',
    this.time = '',
    this.postImages = const [],
    this.isActive = false,
    this.price = '',
    this.type = '',
    this.id = '',
    this.author = '',
    this.avatar = '',
    this.endAt = '',
    this.durationOption = '',
    this.locationOption = '',
    this.shippingOption = '',
    this.authorId = '',
    this.title = '',
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    json['images'].forEach((item) => images.add(item.toString()));
    return Post(
      name: json['name'],
      location: json['location'] ?? '',
      caption: json['caption'] ?? '',
      image: images[0],
      time: timeago.format(DateTime.parse(json['time'])),
      postImages: images,
      isActive: json['isActive'],
      price: json['price'] ?? '',
      type: json['type'],
      id: json['id'].toString(),
      author: json['author'] ?? '',
      avatar: json['avatar'] ?? '',
      endAt: json['endAt'] ?? '',
      durationOption: json['durationOption'] ?? '',
      locationOption: json['locationOption'] ?? '',
      shippingOption: json['shippingOption'] ?? '',
      title: json['title'] ?? '',
      authorId: json['UserId'].toString(),
    );
  }
}
