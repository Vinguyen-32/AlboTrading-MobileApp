import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/screens/trading_details/components/body.dart';

import '../../constants.dart';

class TradingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Body(),
    );
  }
}