import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/bidding_details/components/post_container.dart';
import 'package:plant_trading_app/screens/home/components/title_with_more_btn.dart';
import 'package:plant_trading_app/screens/trading_details/components/post_trading_section.dart';
import 'package:plant_trading_app/screens/trading_details/components/title_with_expand_btn_and_traded_plants.dart';

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
              TitleWithExpandBtnAndTradedPlants(title: "Traded Plants", postId: post.id),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PostTradingSection(post: post),
              ),


            ],
          ),
        ),
      ]),
    );
  }
}