import 'dart:convert';
import 'dart:io';

import '../../../globals.dart' as globals;
import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/models/NearByPost.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:http/http.dart' as http;

import 'Offer.dart';

class DataProvider {
  final SERVER_BASE_URL = "http://192.168.1.14:8080";
  DataProvider();

  Future<UserProfile> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(SERVER_BASE_URL + '/api/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      return UserProfile();
    }
  }

  Future<UserProfile> signup(String username, String password, String firstName,
      String lastName) async {
    final response = await http.post(
      Uri.parse(SERVER_BASE_URL + '/api/users/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName
      }),
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      return UserProfile();
    }
  }

  Future<List<Post>> getPostData2(String id) async {
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/users/' + id + '/posts'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Post> posts = [];
      jsonResponse.forEach((json) => {posts.add(Post.fromJson(json))});
      return posts;
    } else {
      return [];
    }
  }

  Future<List<Post>> getFeed(String id) async {
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/users/' + id + '/feeds'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
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
    final response = await http.get(Uri.parse(
        SERVER_BASE_URL + '/api/users/' + globals.id + '/posts/near_by'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<NearByPost> posts = [];
      jsonResponse.forEach((json) => {posts.add(NearByPost.fromJson(json))});
      return posts;
    } else {
      return [];
    }
  }

  Future<UserProfile> getUserProfileData2(String id) async {
    final response =
        await http.get(Uri.parse(SERVER_BASE_URL + '/api/users/' + id));

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
    String price,
  ) async {
    http.MultipartRequest request = http.MultipartRequest('POST',
        Uri.parse(SERVER_BASE_URL + '/api/users/' + globals.id + '/posts'));

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
    request.fields['price'] = price;

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
    print(SERVER_BASE_URL + '/api/users/' + globals.id + '/bid/' + postId);
    final response = await http.post(
      Uri.parse(
          SERVER_BASE_URL + '/api/users/' + globals.id + '/bid/' + postId),
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
        'POST',
        Uri.parse(
            SERVER_BASE_URL + '/api/users/' + globals.id + '/offer/' + postId));

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
    final response = await http
        .get(Uri.parse(SERVER_BASE_URL + '/api/posts/' + postId + '/offers'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Offer> offers = [];
      jsonResponse.forEach((json) => {offers.add(Offer.fromJson(json))});
      return offers;
    } else {
      return [];
    }
  }

  Future<UserProfile> updateProfilePicture(PickedFile? image) async {
    http.MultipartRequest request = http.MultipartRequest('PUT',
        Uri.parse(SERVER_BASE_URL + '/api/users/' + globals.id + '/avatar'));

    // Set Header
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    request.files.add(http.MultipartFile.fromBytes(
        'images', File(image!.path).readAsBytesSync(),
        filename: image.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      var raw;
      await response.stream.transform(utf8.decoder).listen(
        (value) {
          raw = value;
        },
      );

      var user = UserProfile.fromJson(jsonDecode(raw));
      return user;
    } else {
      return UserProfile();
    }
  }
}
