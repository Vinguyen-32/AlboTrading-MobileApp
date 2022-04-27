import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/components/my_bottom_nav_bar.dart';

import '../../constants.dart';
import 'package:plant_trading_app/screens/user_profile/components/body.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {},
          child: const Text('Vi Nguyen'), //Passing user's account name here
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/add-post.png',
                color: Colors.white,
              )
          ),
          SizedBox(width: kDefaultPadding/2)
        ],
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}