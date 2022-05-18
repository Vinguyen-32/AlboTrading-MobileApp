import 'dart:convert';

import 'package:plant_trading_app/models/NearByPost.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:http/http.dart' as http;



class DataProvider {
  final SERVER_BASE_URL = "http://192.168.1.20:8080";
  DataProvider();

  Future<List<Post>> getPostData2() async {
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/users/1/posts'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Post> posts = [];
      jsonResponse.forEach((json) => {posts.add(Post.fromJson(json))});
      return posts;
    } else {
      return [];
    }
  }

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

  Future<List<NearByPost>> getNearByPostData() async{
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/users/1/posts/near_by'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<NearByPost> posts = [];
      jsonResponse.forEach((json) => {posts.add(NearByPost.fromJson(json))});
      return posts;
    } else {
      return [];
    }
  }

  Future<UserProfile> getUserProfileData2() async{
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/users/1'));

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      return UserProfile();
    }
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
      newPostImage: [

      ],
    );
  }
}
