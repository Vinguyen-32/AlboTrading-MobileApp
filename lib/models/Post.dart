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
}
