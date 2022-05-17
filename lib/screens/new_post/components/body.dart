import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/new_post/components/trading_post_page.dart';

import 'auction_post_page.dart';
import 'listing_type.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    UserProfile userProfileData = DataProvider().getUserProfileData();

    void changeTab(int idx){
      setState(() {
        tabIndex = idx;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListingType(
            changeTab: changeTab
          ),
          tabIndex == 0 ? TradingPostPage() : AuctionPostPage(),
        ],
      ),
    );
    // return SingleChildScrollView(
    //   child: Column(
    //     children: <Widget>[
    //       ListingType(),
    //     ],
    //   ),
    // );
  }
}


