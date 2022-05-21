import 'package:timeago/timeago.dart' as timeago;

class NearByPost {
  final String plantName, author, image, time, type, id;
  final int? price;
  final bool isLocal;

  NearByPost({
    this.plantName = '',
    this.author = '',
    this.type = '',
    this.price = 0,
    this.image = '',
    this.time = '',
    this.isLocal = false,
    this.id = ''
  });

  factory NearByPost.fromJson(Map<String, dynamic> json) {
    return NearByPost(
      plantName: json['plantName'],
      author: json['author'],
      type: json['type'],
      price: json['price'],
      image: json['image'],
      time: timeago.format(DateTime.parse(json['time'])),
      isLocal: json['isLocal'],
      id: json['id'],
    );
  }
}
