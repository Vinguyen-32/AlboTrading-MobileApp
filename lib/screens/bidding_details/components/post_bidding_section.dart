import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/Post.dart';

import '../../../constants.dart';

class PostBiddingSection extends StatelessWidget {

  final Post post;

  const PostBiddingSection({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              child: (
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: 20,
                    height: 20,
                  )
              ),
            ),
            Text(
              'Bidding ends in 1 day 6 hours | Friday, 10:00 AM',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Container(
              // padding: const EdgeInsets.all(4.0),
              child: (
                  Image.asset(
                    'assets/icons/dollar-symbol.png',
                    // width: 30,
                    // height: 30,
                    color: kPrimaryColor,
                  )
              ),
            ),
            Text(
              "250",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 50,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              // padding: const EdgeInsets.all(4.0),
              child: (
                  Image.asset(
                    'assets/icons/location.png',
                    width: 20,
                    height: 20,
                  )
              ),
            ),
            Text(
              "  Local Pickup - ",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              // padding: const EdgeInsets.all(4.0),
              child: (
                  Image.asset(
                    'assets/icons/delivery-truck.png',
                    width: 20,
                    height: 20,
                  )
              ),
            ),
            Text(
              "  Shipping -",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 5),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Bid Amount',
                  isDense: true,
                  contentPadding: EdgeInsets.all(9),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width:200,
                height: 39,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Place Bid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.red, // background
                  //   onPrimary: Colors.white, // foreground
                  // ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width:200,
                height: 39,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Add to Wishlist',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.red, // background
                  //   onPrimary: Colors.white, // foreground
                  // ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}