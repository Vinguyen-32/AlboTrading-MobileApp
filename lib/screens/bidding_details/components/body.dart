import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/screens/bidding_details/components/post_bidding_section.dart';
import 'package:plant_trading_app/screens/bidding_details/components/post_container.dart';

import 'package:plant_trading_app/models/DataProvider.dart';

import '../../../models/Post.dart';

class Body extends StatelessWidget {
  final Post post;

  const Body({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              PostContainer(post: post),
              SizedBox(height: 10),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PostBiddingSection(post: post),
              ),
            ],
          ),
        ),
      ]),
    );
    // return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 5.0),
    //   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //   color: Colors.white,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: <Widget>[
    //       PostHeader(post: post),
    //     ],
    //   ),
    // );
  }
}
