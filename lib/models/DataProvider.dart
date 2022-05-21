import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/models/NearByPost.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:http/http.dart' as http;

import 'Offer.dart';

class DataProvider {
  final SERVER_BASE_URL = "http://192.168.1.17:8080";
  DataProvider();

  Future<List<Post>> getPostData2() async {
    final response =
        await http.get(Uri.parse(SERVER_BASE_URL + '/api/users/1/posts'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(response.body);
      List<Post> posts = [];
      jsonResponse.forEach((json) => {posts.add(Post.fromJson(json))});
      return posts;
    } else {
      return [];
    }
  }

  Future<Post> getPost(String id) async {
    final response =
        await http.get(Uri.parse(SERVER_BASE_URL + '/api/posts/' + id));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      return Post();
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

  Future<List<NearByPost>> getNearByPostData() async {
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

  Future<UserProfile> getUserProfileData2() async {
    final response =
        await http.get(Uri.parse(SERVER_BASE_URL + '/api/users/1'));

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
      newPostImage: [],
    );
  }

  Future<Post> createPost(
    String title,
    String type,
    String location,
    String caption,
    List<XFile> images,
    String durationOption,
    String locationOption,
    String shippingOption,
  ) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse(SERVER_BASE_URL + '/api/users/1/posts'));

    // Set Header
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    request.fields['title'] = title;
    request.fields['type'] = type;
    request.fields['location'] = location;
    request.fields['caption'] = caption;
    request.fields['durationOption'] = durationOption;
    request.fields['locationOption'] = locationOption;
    request.fields['shippingOption'] = shippingOption;

    images.forEach((item) {
      request.files.add(http.MultipartFile.fromBytes(
          'images', File(item!.path).readAsBytesSync(),
          filename: item!.path));
    });

    final response = await request.send();

    if (response.statusCode == 200) {
      return Post();
    } else {
      return Post();
    }
  }

  Future<Post> placeBid(
    String postId,
    String userId,
    double amount,
  ) async {
    print(SERVER_BASE_URL + '/api/users/1/bid/' + postId);
    final response = await http.post(
      Uri.parse(SERVER_BASE_URL + '/api/users/1/bid/' + postId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'amount': amount.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return Post();
    } else {
      return Post();
    }
  }

  Future<Post> offerTrade(
    String postId,
    String title,
    List<XFile> images,
  ) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse(SERVER_BASE_URL + '/api/users/1/offer/' + postId));

    // Set Header
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    request.fields['title'] = title;

    images.forEach((item) {
      request.files.add(http.MultipartFile.fromBytes(
          'images', File(item!.path).readAsBytesSync(),
          filename: item!.path));
    });

    final response = await request.send();

    if (response.statusCode == 200) {
      return Post();
    } else {
      return Post();
    }
  }

  Future<List<Offer>> getOffers(String postId) async {
    final response =
    await http.get(Uri.parse(SERVER_BASE_URL + '/api/posts/' + postId + '/offers'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Offer> offers = [];
      jsonResponse.forEach((json) => {offers.add(Offer.fromJson(json))});
      return offers;
    } else {
      return [];
    }
  }
}
