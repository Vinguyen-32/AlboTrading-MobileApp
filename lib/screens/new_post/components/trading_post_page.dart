import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';

import '../../../constants.dart';

class TradingPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List postData = DataProvider().getPostData();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/back_icon.png',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/search_icon.png',
                  color: Colors.white,
                )
            ),
            SizedBox(width: kDefaultPadding/2)
          ],
        ),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          // userProfile.profileImage,
                          'assets/images/img.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // const SizedBox(width: 2,),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vi Nguyen',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'Trading List',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );

    // return SingleChildScrollView(
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //         margin: const EdgeInsets.symmetric(vertical: 5.0),
    //         padding: const EdgeInsets.symmetric(vertical: 8.0),
    //         color: Colors.white,
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(left: 20, top: 10),
    //               child: Row(
    //                 children: [
    //                   ClipOval(
    //                     child: Image.asset(
    //                       // userProfile.profileImage,
    //                       'assets/images/img.png',
    //                       height: 50,
    //                       width: 50,
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   const SizedBox(width: 2,),
    //                   Expanded(
    //                     flex: 6,
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           'Vi Nguyen',
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w600,
    //                             fontSize: 17,
    //                           ),
    //                         ),
    //                         Text(
    //                           'Trading List',
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: 17,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}