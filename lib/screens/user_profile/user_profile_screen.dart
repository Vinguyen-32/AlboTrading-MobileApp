import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/components/my_bottom_nav_bar.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/auction_listing/auction_listing_screen.dart';
import 'package:plant_trading_app/screens/trade_listing/trade_listing_screen.dart';

import '../../constants.dart';
import 'package:plant_trading_app/screens/user_profile/components/body.dart';


class UserProfileScreen extends StatefulWidget {

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserProfile currentUser = DataProvider().getUserProfileData();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        // leading: TextButton(
        //   style: TextButton.styleFrom(
        //     textStyle: const TextStyle(fontSize: 20),
        //   ),
        //   onPressed: () {},
        //   child: const Text(
        //     '@vinguyen32',
        //     style: TextStyle(
        //       color: Colors.white,
        //     ),
        //   ), //Passing user's account name here
        // ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            '@vinguyen32',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),//Passing user's account name here
        leadingWidth: 200,
        actions: <Widget>[
          IconButton(
              onPressed: () => _showListingTypes(context),
              icon: Image.asset(
                'assets/icons/add-post.png',
                color: Colors.white,
              )
          ),
          SizedBox(width: kDefaultPadding/2)
        ],
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
  
  void _showListingTypes(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          // color: Color(0xFF737373),
          height: 240,
          child: Container(
            child: _buildBottomNavigationMenu(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
          ),
        );
      }
    );
  }
  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        // Column(
        //   children: <Widget>[
            const Divider(
              thickness: 5,
              indent: 170,
              endIndent: 170,
              height: 20,
            ),
            ListTile(
              title: Text(
                "Choose Listing Type",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(),
        //   ],
        // ),
        ListTile(
          leading: Image.asset(
            "assets/icons/trade.png",
          ),
          title: Text(
            "Trading List",
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TradeListingScreen(),
            ),
          ),
        ),
        ListTile(
            leading: Image.asset(
              "assets/icons/auction.png",
            ),
            title: Text(
              "Bidding List",
            ),
            onTap: () =>  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuctionListingScreen(currentUser: currentUser),
              ),
            ),
        ),
      ],
    );
  }
}