import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/screens/trading_details/components/traded_plants_card.dart';

import '../../../models/DataProvider.dart';
import '../../../models/Offer.dart';
import '../trading_details_screen.dart';

class TitleWithExpandBtnAndTradedPlants extends StatefulWidget {
  final String title;
  final String postId;

  const TitleWithExpandBtnAndTradedPlants({
    Key? key,
    required this.title,
    required this.postId,
  }) : super(key: key);

  @override
  TitleWithExpandBtnAndTradedPlantsState createState() =>
      TitleWithExpandBtnAndTradedPlantsState();
}

class TitleWithExpandBtnAndTradedPlantsState
    extends State<TitleWithExpandBtnAndTradedPlants> {
  late Future<List<Offer>> futureOffer;

  @override
  void initState() {
    super.initState();
    futureOffer = DataProvider().getOffers(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.only(left: 0),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                FutureBuilder<List<Offer>>(
                    future: futureOffer,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> offers = [];
                        snapshot.data!.forEach((offer) => {
                              offers.add(TrandedPlantsCard(
                                image: (offer.images ?? [])[0],
                                title: offer.title,
                                account: offer.name,
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TradingDetailsScreen(postId: '1'),
                                    ),
                                  );
                                },
                              ))
                            });

                        return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: offers));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    })
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
