import 'package:flutter/cupertino.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/user_profile/components/round_shortcut_post.dart';
import 'package:plant_trading_app/screens/user_profile/components/user_profile_info.dart';

import 'galery_section.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    UserProfile userProfileData = DataProvider().getUserProfileData();

    return SingleChildScrollView(
        child: Column(
          children: [
            UserProfileInfo(userProfile: userProfileData,),
            SizedBox(height: 12),
            RoundShortcutPost(),
            SizedBox(height: 24),
            GalerySection(),
          ],
        ),
    );
  }
}