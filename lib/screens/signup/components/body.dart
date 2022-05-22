import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/screens/home/home_screen.dart';
import 'package:plant_trading_app/screens/login/login_screen.dart';
import 'package:plant_trading_app/screens/signup/components/background.dart';
import 'package:plant_trading_app/screens/login/components/existed_account_check.dart';
import 'package:plant_trading_app/screens/login/components/password_field.dart';
import 'package:plant_trading_app/screens/login/components/username_field.dart';
import 'package:plant_trading_app/screens/signup/components/firstname_field.dart';
import 'package:plant_trading_app/screens/signup/components/lastname_field.dart';
import 'package:plant_trading_app/screens/signup/signup_screen.dart';
import 'package:plant_trading_app/screens/welcome/components/rounded_button.dart';

class Body extends StatelessWidget{
  String username = '';
  String password = '';
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Username is not available'),
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
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoMono',
              ),
            ),
            SvgPicture.asset(
              "assets/images/Usability testing-pana.svg",
              height: size.height * 0.38,
            ),
            FirstNameField(
              hintText: "First name",
              onChanged: (value) {
                firstName = value;
              }
            ),
            LastNameField(
                hintText: "Last name",
                onChanged: (value) {
                  lastName = value;
                }
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
              text: "SIGNUP",
              press: () async {
                final user = await DataProvider().signup(username, password, firstName, lastName);

                if (user.id != ''){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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





