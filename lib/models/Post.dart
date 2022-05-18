import 'package:timeago/timeago.dart' as timeago;

class Post {
  final String name, location, caption, image, time;
  final List<String>? postImages;
  final bool isActive;

  Post({
    this.name = '',
    this.location = '',
    this.caption = '',
    this.image = '',
    this.time = '',
    this.postImages = const[],
    this.isActive = false,
  });

   factory Post.fromJson(Map<String, dynamic> json) {
     List<String> images = [];
     json['images'].forEach((item) => images.add(item.toString()));
     return Post(
       name:  json['name'],
       location: json['location'],
       caption: json['caption'],
       image: images[0],
       time:  timeago.format(DateTime.parse(json['time'])),
       postImages: images,
       isActive: json['isActive'],
     );
  }
}
