// @dart=2.9
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/screens/home/home_screen.dart';
import 'package:plant_trading_app/screens/new_post/new_post_screen.dart';
import 'package:plant_trading_app/screens/user_profile/user_profile_screen.dart';
import 'package:plant_trading_app/helper/dependencies.dart' as dep;
import 'package:plant_trading_app/screens/welcome/welcome_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Trading App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        // scaffoldBackgroundColor: secondaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
      // home: UserProfileScreen(),
      // home: NewPostScreen(),
      home: WelcomeScreen(),
    );
  }
}