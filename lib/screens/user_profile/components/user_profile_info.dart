import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class UserProfileInfo extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileInfo({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    userProfile.profileImage,
                    // 'assets/images/img.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 2,),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        userProfile.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      SmoothStarRating(
                        allowHalfRating: true,
                        borderColor: kPrimaryColor,
                        rating: userProfile.stars.toDouble(),
                        starCount: userProfile.stars,
                        halfFilledIconData: Icons.star_half,
                        size: 18.0,
                        spacing: 0.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                        userProfile.trade.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Trades',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                        userProfile.bid.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Bids',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left:20.0),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Text(
                        userProfile.followers.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Text(
                        userProfile.following.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50,),
                Expanded(
                  // flex: 3,
                  child: SizedBox(
                    width: 70,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}