import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/bidding_details/components/post_container.dart';
import 'package:plant_trading_app/screens/home/components/title_with_more_btn.dart';
import 'package:plant_trading_app/screens/trading_details/components/post_trading_section.dart';
import 'package:plant_trading_app/screens/trading_details/components/title_with_expand_btn_and_traded_plants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    List postData = DataProvider().getPostData();

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              PostContainer(post: postData[1]),
              SizedBox(height: 10),
              const Divider(),
              TitleWithExpandBtnAndTradedPlants(title: "Traded Plants"),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PostTradingSection(post: postData[1]),
              ),


            ],
          ),
        ),
      ]),
    );
  }
}