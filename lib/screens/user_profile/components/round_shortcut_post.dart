import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../models/DataProvider.dart';
import '../../../models/Post.dart';
import '../../bidding_details/bidding_details_screen.dart';
import '../../trading_details/trading_details_screen.dart';

class RoundShortcutPost extends StatefulWidget {
  final String userId;
  const RoundShortcutPost({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  RoundShortcutPostState createState() => RoundShortcutPostState();
}

class RoundShortcutPostState extends State<RoundShortcutPost> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = DataProvider().getPostData2(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> items = [];
          snapshot.data!.forEach(
            (post) => {
              items.add(Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0x52181818),
                            ),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => post.type.toString() ==
                                          'BIDDING'
                                      ? BiddingDetailsScreen(postId: post.id)
                                      : TradingDetailsScreen(postId: post.id),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              // radius: 10,
                              backgroundImage:
                                  NetworkImage((post.postImages ?? [])[0]),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: ClipOval(
                            child: Image.asset(
                              post.type == 'BIDDING'
                                  ? 'assets/icons/auction.png'
                                  : 'assets/icons/trade.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.title.length <= 10
                      ? post.title
                      : (post.title.substring(0, 10) + "...")),
                ],
              ))
            },
          );
          items.add(SizedBox(
            width: 14,
          ));
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(children: items),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );

    // return SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 12),
    //     child: Row(
    //       children: [
    //         Column(
    //           children: [
    //             Stack(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     height: 80,
    //                     width: 80,
    //                     padding: const EdgeInsets.all(4),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                         color: Color(0x52181818),
    //                       ),
    //                       borderRadius: BorderRadius.circular(80),
    //                     ),
    //                     child: CircleAvatar(
    //                       // radius: 10,
    //                       backgroundImage: AssetImage('assets/images/img1.jpg'),
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 0,
    //                   bottom: 0,
    //                   child: Container(
    //                     height: 30,
    //                     width: 30,
    //                     decoration: BoxDecoration(
    //                         // color: kPrimaryColor,
    //                         // shape: BoxShape.circle,
    //
    //                         // borderRadius: BorderRadius.circular(20),
    //                         // border: Border.all(
    //                         //   color: Theme.of(context).scaffoldBackgroundColor,
    //                         //   width: 2,
    //                         // ),
    //
    //                         ),
    //                     // child: CircleAvatar(
    //                     //   // radius: 10,
    //                     //   backgroundImage: AssetImage('assets/icons/bidding-type.png'),
    //                     //   backgroundColor: Colors.white,
    //                     // ),
    //                     child: ClipOval(
    //                       child: Image.asset(
    //                         'assets/icons/auction.png',
    //                         fit: BoxFit.fill,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 4,
    //             ),
    //             const Text('Dragon Scale ...'),
    //           ],
    //         ),
    //         const SizedBox(
    //           width: 14,
    //         ),
    //         Column(
    //           children: [
    //             Stack(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     height: 80,
    //                     width: 80,
    //                     padding: const EdgeInsets.all(4),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                         color: Color(0x52181818),
    //                       ),
    //                       borderRadius: BorderRadius.circular(80),
    //                     ),
    //                     child: CircleAvatar(
    //                       // radius: 10,
    //                       backgroundImage: AssetImage('assets/images/img3.png'),
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 0,
    //                   bottom: 0,
    //                   child: Container(
    //                     height: 30,
    //                     width: 30,
    //                     decoration: BoxDecoration(
    //                         // color: kPrimaryColor,
    //                         // shape: BoxShape.circle,
    //
    //                         // borderRadius: BorderRadius.circular(20),
    //                         // border: Border.all(
    //                         //   color: Theme.of(context).scaffoldBackgroundColor,
    //                         //   width: 2,
    //                         // ),
    //
    //                         ),
    //                     // child: CircleAvatar(
    //                     //   // radius: 10,
    //                     //   backgroundImage: AssetImage('assets/icons/bidding-type.png'),
    //                     //   backgroundColor: Colors.white,
    //                     // ),
    //                     child: ClipOval(
    //                       child: Image.asset(
    //                         'assets/icons/trade.png',
    //                         fit: BoxFit.fill,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 4,
    //             ),
    //             const Text('Clarinervium ...'),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
