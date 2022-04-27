import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/screens/bidding_details/bidding_details_screen.dart';

import 'package:plant_trading_app/screens/trading_details/components/traded_plants_card.dart';

import '../trading_details_screen.dart';

class TitleWithExpandBtnAndTradedPlants extends StatelessWidget {
  const TitleWithExpandBtnAndTradedPlants({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

            child: ExpansionTile(
              tilePadding: EdgeInsets.only(left: 0),
              title: Text (
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      TrandedPlantsCard(
                        image: "assets/images/img3.png",
                        title: "Albo",
                        account: "Vi Nguyen",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TradingDetailsScreen(),
                            ),
                          );
                        },
                      ),
                      TrandedPlantsCard(
                        image: "assets/images/img4.png",
                        title: "Albo",
                        account: "Vi Nguyen",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BiddingDetailsScreen(),
                            ),
                          );
                        },
                      ),
                      TrandedPlantsCard(
                        image: "assets/images/img5.png",
                        title: "Albo",
                        account: "Vi Nguyen",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BiddingDetailsScreen(),
                            ),
                          );
                        },
                      ),
                    ],
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


// class TitleWithCustomUnderline extends StatelessWidget {
//   const TitleWithCustomUnderline({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 24,
//       child: Stack(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: kDefaultPadding / 4),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               margin: EdgeInsets.only(right: kDefaultPadding / 4),
//               height: 7,
//               color: kPrimaryColor.withOpacity(0.2),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }