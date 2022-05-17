import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'components/body.dart';

import '../../../constants.dart';

class TradeListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
            onPressed: () {},
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: kDefaultPadding / 2,),
        ],
      ),
      body: Body(),
    );
  }
}