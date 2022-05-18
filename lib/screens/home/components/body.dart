import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/home/components/recommend_plants.dart';
import 'package:plant_trading_app/screens/home/components/post_card.dart';

import 'package:plant_trading_app/screens/home/components/title_with_more_btn.dart';

import 'header_with_searchbox.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provides total height and width of the screen
    Size size = MediaQuery.of(context).size;
    List postData = DataProvider().getPostData();

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

          ...postData.map((post) {
            return PostCard(
              post: post,
              press: () {},
            );
          })

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











