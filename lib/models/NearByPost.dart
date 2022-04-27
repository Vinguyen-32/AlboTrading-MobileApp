class NearByPost {
  final String plantName, author, image, time, type;
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
  });
}