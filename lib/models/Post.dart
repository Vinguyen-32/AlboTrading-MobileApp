import 'package:timeago/timeago.dart' as timeago;

class Post {
  final String username, location, caption, profileImage, time;
  final List<String>? postImages;
  final bool isActive;

  Post({
    this.username = '',
    this.location = '',
    this.caption = '',
    this.profileImage = '',
    this.time = '',
    this.postImages = const[],
    this.isActive = false,
  });

   factory Post.fromJson(Map<String, dynamic> json) {
     List<String> postImages = [];
     json['postImages'].forEach((item) => postImages.add(item.toString()));
     return Post(
       username:  json['username'],
       location: json['location'],
       caption: json['caption'],
       profileImage: json['profileImage'],
       time:  timeago.format(DateTime.parse(json['time'])),
       postImages: postImages,
       isActive: json['isActive'],
     );
  }
}
