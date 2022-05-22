import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/home/components/recommend_plants.dart';
import 'package:plant_trading_app/screens/home/components/post_card.dart';

import 'package:plant_trading_app/screens/home/components/title_with_more_btn.dart';

import '../../../models/Post.dart';
import '../../../globals.dart' as globals;
import '../../bidding_details/bidding_details_screen.dart';
import '../../trading_details/trading_details_screen.dart';
import 'header_with_searchbox.dart';
import 'title_with_more_btn.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = DataProvider().getFeed(globals.id);
  }

  @override
  Widget build(BuildContext context) {
    // Provides total height and width of the screen
    Size size = MediaQuery.of(context).size;
    // List postData = DataProvider().getPostData();

    // enables scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Popular Nearby", press: () {}),
          RecommendsPlants(),
          TitleWithMoreBtn(title: "Your Feed", press: () {}),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: postsData.length,
          //     itemBuilder: (context, index) => PostCard(post: postsData[index]),
          //   ),
          // )

          FutureBuilder<List<Post>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> posts = [];
                snapshot.data!.forEach(
                  (post) => {
                    posts.add(
                      PostCard(
                        post: post,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => post.type.toString() ==
                                          'BIDDING'
                                      ? BiddingDetailsScreen(postId: post.id)
                                      : TradingDetailsScreen(postId: post.id)));
                        },
                      ),
                    )
                  },
                );
                return Column(
                  children: posts,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: postsData.length,
          //   itemBuilder: (context, index) => PostCard(
          //     post: postsData[index],
          //     press: () {},),
          // )
        ],
      ),
    );
  }
}
