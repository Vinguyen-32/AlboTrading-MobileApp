import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/screens/home/components/body.dart';
import 'package:plant_trading_app/components/my_bottom_nav_bar.dart';
import 'package:plant_trading_app/screens/user_profile/user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 100,
      //   iconSize: 30,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: textColor,), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.search_outlined, color: textColor,), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: textColor,), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline, color: Colors.black54,), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.black54,), label: ""),
      //   ],
      // ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      // leading: TextButton(
      //     onPressed: () {
      //       debugPrint('Console Message Using Debug Print');
      //     },
      //     child:Text("AlboTrade")
      // )
      leading: Padding(
        padding:
            const EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
        child: Text(
          'AlboTrade',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ), //Passing user's account name here
      leadingWidth: 200,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(),
              ),
            ),
            color: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                // userProfile.profileImage,
                'assets/images/img.png',
                height: 43,
                width: 43,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

