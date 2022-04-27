import 'package:plant_trading_app/models/NearByPost.dart';
import 'package:plant_trading_app/models/UserProfile.dart';

import 'Post.dart';

class DataProvider {

  DataProvider();

  List getPostData() {
    return [
      Post(
        name: "Jenny",
        location: "San Jose",
        caption: "Monstera Albo Fully Rooted Plant",
        image: "assets/images/img.png",
        time: "3m ago",
        postImages: [
          "assets/images/img2.png",
          "assets/images/img2.png",
          "assets/images/img2.png",
        ],
        isActive: true,
      ),
      Post(
        name: "Vi Nguyen",
        location: "San Francisco",
        caption: "Monstera Albo Fully Rooted Plant",
        image: "assets/images/img.png",
        time: "3m ago",
        postImages: [
          "assets/images/img2.png",
          "assets/images/img1.jpg",
          "assets/images/img2.png",
        ],
        isActive: false,
      ),
      Post(
        name: "Lisa",
        location: "San Jose",
        caption: "Monstera Albo Fully Rooted Plant",
        image: "assets/images/img.png",
        time: "3m ago",
        postImages: [
          "assets/images/img1.jpg",
          "assets/images/img1.jpg",
          "assets/images/img1.jpg",
        ],
        isActive: true,
      ),
    ];
  }

  List getNearByPostData() {
    return [
      NearByPost(
        plantName: "Snake Plant",
        author: "Jenny",
        image: "assets/images/img.png",
        time: "3m ago",
        price: 0,
        type: "TRADING",
        isLocal: true,
      ),
      NearByPost(
        plantName: "Florida Beauty",
        author: "Sam",
        image: "assets/images/img4.png",
        time: "3m ago",
        price: 500,
        type: "BIDDING",
        isLocal: true,
      ),
      NearByPost(
        plantName: "Clarinervium",
        author: "Chloe",
        image: "assets/images/img3.png",
        time: "3m ago",
        price: 0,
        type: "TRADING",
        isLocal: true,
      ),
    ];
  }

  UserProfile getUserProfileData() {
    return UserProfile(
      profileImage: "assets/images/img1.jpg",
      name: "Vi Nguyen",
      accountName: "samvi32",
      followers: 190,
      following: 32,
      reviews: 23,
      stars: 5,
      galeryImages: [
        "assets/images/img.png",
        "assets/images/img1.jpg",
        "assets/images/img2.png",
        "assets/images/img3.png",
        "assets/images/img4.png",
      ],
    );
  }
}
