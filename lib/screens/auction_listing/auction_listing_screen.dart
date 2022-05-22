import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import '../user_profile/user_profile_screen.dart';
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

  final TextEditingController _titleBoxController = TextEditingController();
  final TextEditingController _priceBoxController = TextEditingController();
  final TextEditingController _descriptionBoxController =
      TextEditingController();
  String durationOption = '';
  String locationOption = '';
  String shippingOption = '';
  List<XFile> selectedImages = [];

  void setDurationOption(String value) {
    durationOption = value;
  }

  void setLocationOption(String value) {
    locationOption = value;
  }

  void setShippingOption(String value) {
    shippingOption = value;
  }

  void setSelectedImages(List<XFile> value) {
    selectedImages = value;
  }

  @override
  Widget build(BuildContext context) {

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
          SizedBox(
            width: kDefaultPadding / 2,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          isPosting
              ? LinearProgressIndicator(
                  value: 0.7,
                )
              : Text(""),
          Body(
            _titleBoxController,
            _priceBoxController,
            _descriptionBoxController,
            setDurationOption,
            setLocationOption,
            setShippingOption,
            setSelectedImages,
          ),
        ],
      ),
    );
  }

  handleSubmit() {
    setState(() {
      isPosting = true;
    });

    Future.wait([
      DataProvider().createPost(
        _titleBoxController.text,
        'BIDDING',
        '',
        _descriptionBoxController.text,
        selectedImages,
        durationOption,
        locationOption,
        shippingOption,
        _priceBoxController.text
      )
    ]);

    setState(() {
      isPosting = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfileScreen()),
    );
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
