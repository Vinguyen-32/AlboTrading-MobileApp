import 'Post.dart';

class UserProfile {
  final String name, accountName, profileImage;
  final int following, followers, reviews, stars;
  final List<String>? galeryImages;
  final List<String> newPostImage;
  final String postType;
  // final bool isActive;

  UserProfile({
    this.profileImage = '',
    this.name = '',
    this.accountName = '',
    this.followers = 0,
    this.following = 0,
    this.reviews = 0,
    this.stars = 0,
    this.galeryImages = const[],
    this.newPostImage = const[],
    this.postType = '',
  });
}