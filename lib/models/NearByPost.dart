import 'package:timeago/timeago.dart' as timeago;

class NearByPost {
  final String title, username, profileImage, time, type;
  final List<String> postImages;
  final int startingBid, currentBid;
  final int duration;
  final String description, localPickupStatus, shippingStatus;
  final bool isLocal;

  NearByPost({
    this.title = '',
    this.username = '',
    this.type = '',
    this.startingBid = 0,
    this.currentBid = 0,
    this.profileImage = '',
    this.postImages = const[],
    this.time = '',
    this.isLocal = false,
    this.duration = 1,
    this.description = '',
    this.localPickupStatus = 'Not Available',
    this.shippingStatus = 'Not Available',
  });

  factory NearByPost.fromJson(Map<String, dynamic> json) {
    List<String> postImages = [];
    json['postImages'].forEach((item) => postImages.add(item.toString()));
    return NearByPost(
      title: json['title'],
      username: json['username'],
      type: json['type'],
      startingBid: json['startingBid'],
      profileImage: json['profileImage'],
      postImages: postImages,
      time: timeago.format(DateTime.parse(json['time'])),
      isLocal: json['isLocal'],
      duration: json['duration'],
      description: json['description'],
      localPickupStatus: json['localPickupStatus'],
      shippingStatus: json['shippingStatus'],
    );
  }
}
