import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/trade_listing/components/listing_details.dart';
import 'package:plant_trading_app/screens/trade_listing/components/user_account.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final TextEditingController _titleBoxController;
  final TextEditingController _descriptionBoxController;
  final Function setLocationOption;
  final Function setShippingOption;
  final Function setSelectedImages;

  Body(
    this._titleBoxController,
    this._descriptionBoxController,
    this.setLocationOption,
    this.setShippingOption,
    this.setSelectedImages,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    UserProfile userProfileData = DataProvider().getUserProfileData();

    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       UserProfileInfo(userProfile: userProfileData,),
    //       SizedBox(height: 12),
    //       RoundShortcutPost(),
    //       SizedBox(height: 24),
    //     ],
    //   ),
    // );
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                UserAccount(),
                ListingDetails(
                  titleBoxController: _titleBoxController,
                  descriptionBoxController: _descriptionBoxController,
                  setLocationOption: setLocationOption,
                  setShippingOption: setShippingOption,
                  setSelectedImages: setSelectedImages,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
