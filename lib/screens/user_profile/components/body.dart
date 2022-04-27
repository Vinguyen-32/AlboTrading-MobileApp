import 'package:flutter/cupertino.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/user_profile/components/user_profile_info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    UserProfile userProfileData = DataProvider().getUserProfileData();

    return SingleChildScrollView(
      child: UserProfileInfo(userProfile: userProfileData,),
    );
  }
}