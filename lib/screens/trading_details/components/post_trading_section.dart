import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/Post.dart';

import '../../../constants.dart';

class PostTradingSection extends StatelessWidget {
  final Post post;

  const PostTradingSection({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
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
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
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
        ),
        SizedBox(height: 40,),
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
                    'Upload Your Plant',
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