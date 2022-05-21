import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/screens/home/home_screen.dart';
import 'package:plant_trading_app/screens/login/components/background.dart';
import 'package:plant_trading_app/screens/login/components/existed_account_check.dart';
import 'package:plant_trading_app/screens/login/components/password_field.dart';
import 'package:plant_trading_app/screens/login/components/username_field.dart';
import 'package:plant_trading_app/screens/signup/signup_screen.dart';
import 'package:plant_trading_app/screens/welcome/components/rounded_button.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) {},
              ),
              PasswordField(
                hintText: "Password",
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
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





