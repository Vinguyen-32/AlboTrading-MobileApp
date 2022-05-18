import 'package:flutter/material.dart';

import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/bidding_details/bidding_details_screen.dart';
import 'package:plant_trading_app/screens/trading_details/trading_details_screen.dart';

class RecommendsPlants extends StatelessWidget {
  const RecommendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List nearByData = DataProvider().getNearByPostData();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...nearByData.map((post){
            return RecommendPlantCard(
              image: post.image,
              plantName: post.plantName,
              account: post.author,
              type: post.type as String,
              press: () {
                if (post.type.toString() == "TRADING") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TradingDetailsScreen(),
                    ),
                  );
                } else if (post.type.toString() == "BIDDING") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BiddingDetailsScreen(),
                    ),
                  );
                }
              },
              price: post.price,
            );
          }),
        ],
      ),
    );
  }
}

class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard({
    Key? key,
    required this.image,
    required this.type,
    required this.plantName,
    required this.account,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, type, plantName, account;
  final int price;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding,
        bottom: kDefaultPadding * 1.25,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          // Image.assets goes here
          // Image.asset(image),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 8),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 8),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: kPrimaryColor.withOpacity(0.15),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$plantName\n".toUpperCase(),
                    style: Theme.of(context).textTheme.button,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$account",
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // type == "TRADDING" ?
                      Text(
                        '\$$price',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(fontSize: 17, color: kPrimaryColor),
                        // : ''
                      ),
                    ],
                  ),
                ],
              ),

              // child: Row(
              //   children: <Widget>[
              //     RichText(
              //       text: TextSpan(
              //         children: [
              //           TextSpan(
              //             text: "$plantName\n",
              //             style: Theme.of(context).textTheme.button,
              //           ),
              //           TextSpan(
              //             text: "\n",
              //           ),
              //           TextSpan(
              //             text: "$account",
              //             style: TextStyle(
              //               color: kPrimaryColor.withOpacity(0.5),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Spacer(),
              //     // type == "TRADDING" ?
              //     Text(
              //       '\$$price',
              //       style: Theme.of(context)
              //           .textTheme
              //           .button
              //           ?.copyWith(color: kPrimaryColor),
              //       // : ''
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}