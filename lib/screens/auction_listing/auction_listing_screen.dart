import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'components/body.dart';

import '../../../constants.dart';

class AuctionListingScreen extends StatefulWidget {

  const AuctionListingScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final UserProfile currentUser;
  // AuctionListingScreen({this.currentUser});

  @override
  State<AuctionListingScreen> createState() => _AuctionListingScreenState();
}

class _AuctionListingScreenState extends State<AuctionListingScreen> {
  bool isPosting = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    List postData = DataProvider().getPostData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Listing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         'assets/icons/search_icon.png',
        //         color: Colors.white,
        //       )
        //   ),
        //   SizedBox(width: kDefaultPadding / 2)
        // ],
        actions: <Widget>[
          TextButton(
            onPressed: isPosting ? null : () => handleSubmit(),
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(width: kDefaultPadding / 2,),
        ],
      ),
      body: ListView(
        children: <Widget>[
          isPosting ? LinearProgressIndicator(value: 0.7,) : Text(""),
          Body()
        ],
      ),
    );
  }
  handleSubmit() {
    setState(() {
      isPosting = true;
    });
  }
}

// class AuctionListingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery
//         .of(context)
//         .size;
//     List postData = DataProvider().getPostData();
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'New Listing',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//         ),
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: Image.asset(
//             'assets/icons/back_icon.png',
//             color: Colors.white,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         // actions: <Widget>[
//         //   IconButton(
//         //       onPressed: () {},
//         //       icon: Image.asset(
//         //         'assets/icons/search_icon.png',
//         //         color: Colors.white,
//         //       )
//         //   ),
//         //   SizedBox(width: kDefaultPadding / 2)
//         // ],
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               "Post",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           SizedBox(width: kDefaultPadding / 2,),
//         ],
//       ),
//       body: Body(),
//     );
//   }
// }