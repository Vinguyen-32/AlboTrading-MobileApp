import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/auction_listing/auction_listing_screen.dart';
import 'package:plant_trading_app/screens/home/home_screen.dart';
import 'package:plant_trading_app/screens/trade_listing/trade_listing_screen.dart';
import 'package:plant_trading_app/screens/user_profile/user_profile_screen.dart';

import '../constants.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  late Future<UserProfile> futureCurrentUser;

  @override
  void initState() {
    super.initState();
    futureCurrentUser = DataProvider().getUserProfileData2();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile>(
      future: futureCurrentUser,
      builder: (context, snapshot) {
        // if (snapshot.hasData) {
          UserProfile? user = snapshot.data;
          return Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding * 1.25,
              right: kDefaultPadding * 1.25,
              bottom: kDefaultPadding / 6,
            ),
            height: 75,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -10),
                    blurRadius: 20,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(17),
                    topLeft: Radius.circular(17))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 28,
                    color: textColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search_outlined,
                    size: 28,
                    color: textColor,
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 75,
                  height: 45,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => _showListingTypes(context, user!),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    size: 28,
                    color: textColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    size: 28,
                    color: textColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserProfileScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        // } else if (snapshot.hasError) {
        //   return Text('${snapshot.error}');
        // }
      },
    );
  }

  void _showListingTypes(BuildContext context, UserProfile user) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          // color: Color(0xFF737373),
          height: 240,
          child: Container(
            child: _buildBottomNavigationMenu(user),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildBottomNavigationMenu(UserProfile user) {
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuctionListingScreen(currentUser: user),
            ),
          ),
        ),
      ],
    );
  }
}
