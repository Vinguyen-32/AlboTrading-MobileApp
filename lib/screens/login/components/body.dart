import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../globals.dart' as globals;
import 'package:plant_trading_app/screens/home/home_screen.dart';
import 'package:plant_trading_app/screens/login/components/background.dart';
import 'package:plant_trading_app/screens/login/components/existed_account_check.dart';
import 'package:plant_trading_app/screens/login/components/password_field.dart';
import 'package:plant_trading_app/screens/login/components/username_field.dart';
import 'package:plant_trading_app/screens/signup/signup_screen.dart';
import 'package:plant_trading_app/screens/welcome/components/rounded_button.dart';

import '../../../models/DataProvider.dart';
import '../../../models/UserProfile.dart';

class Body extends StatelessWidget{
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid username / password'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                ),
              ),
              SvgPicture.asset(
                "assets/images/Feed-cuate.svg",
                height: size.height * 0.4,
              ),
              UsernameField(
                hintText: "Username",
                onChanged: (value) {
                  username = value;
                },
              ),
              PasswordField(
                hintText: "Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  final user = await DataProvider().login(username, password);
                  // Login successfully
                  if (user.id != ''){
                    globals.username = user.accountName;
                    globals.avatar = user.profileImage;
                    globals.id = user.id;
                    globals.isLoggedIn = true;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  }
                  else {
                    _showMyDialog();
                  }
                },
              ),
              ExistedAccountCheck(
                login: true,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}





