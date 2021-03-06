import 'package:flutter/material.dart';

import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/bidding_details/bidding_details_screen.dart';
import 'package:plant_trading_app/screens/trading_details/trading_details_screen.dart';

import '../../../models/NearByPost.dart';
import '../../../models/Post.dart';

class RecommendsPlants extends StatefulWidget {
  const RecommendsPlants({Key? key}) : super(key: key);

  @override
  _RecommendsPlantsState createState() => _RecommendsPlantsState();
}

class _RecommendsPlantsState extends State<RecommendsPlants> {
  late Future<List<NearByPost>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = DataProvider().getNearByPostData();
  }

  @override
  Widget build(BuildContext context) {
    // List nearByData = DataProvider().getNearByPostData();


    return FutureBuilder<List<NearByPost>>(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...snapshot.data!.map((post){
                  return RecommendPlantCard(
                    image: post.image,
                    plantName: post.title,
                    account: post.author,
                    type: post.type as String,
                    id: post.id,
                    press: () {
                      print("post.type.toString(): " + post.type.toString());
                      if (post.type.toString() == "TRADING") {
                        print("before click 2: " + post.id.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TradingDetailsScreen(postId: post.id),
                          ),
                        );
                      } else if (post.type.toString() == "BIDDING") {
                        print("before click: " + post.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BiddingDetailsScreen(postId: post.id),
                          ),
                        );
                      }
                    },
                    price: post.price ?? 0,
                  );
                }),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
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
    required this.id,
  }) : super(key: key);

  final String image, type, plantName, account, id;
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
                image: NetworkImage(image),
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