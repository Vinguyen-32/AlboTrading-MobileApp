import 'Post.dart';

class UserProfile {
  final String name, accountName, profileImage;
  final int following, followers, reviews, stars, trade, bid;
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
    this.trade = 0,
    this.bid = 0,
    this.galeryImages = const[],
    this.newPostImage = const[],
    this.postType = '',
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profileImage: json['profileImage'],
      name: json['name'],
      accountName: json['accountName'],
      followers: json['followers'],
      following: json['following'],
      postType: json['postType'],
      reviews: json['reviews'],
      stars: json['stars'],
      trade: json['trade'],
      bid: json['bid'],
      galeryImages: json['galeryImages'].cast<String>(),
      newPostImage: json['newPostImage'].cast<String>(),
    );
  }
}