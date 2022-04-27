import 'package:flutter/material.dart';
import 'package:plant_trading_app/screens/home/components/body.dart';
import 'package:plant_trading_app/components/my_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
        bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: TextButton(
          onPressed: () {
            debugPrint('Console Message Using Debug Print');
          },
          child:Text("AlboTrade")
      )
    );
  }
}